require 'xcodeproj'

# Input
def prompt(*args)
    print(*args)
    STDIN.gets.strip
end

def addFramework(project, framework_name)
    framework_full_name = framework_name + ".framework"
    framework_path = "Carthage/Build/iOS/" + framework_full_name
    
    if !File.exist?(framework_path)
        abort("\nFramework doesn't exist.\n".red)
    end
    
    # Adding to Frameworks folder and sorting
    frameworks_group = project.frameworks_group
    framework_reference = frameworks_group.new_file framework_path
    frameworks_group.sort
    
    # Enumberate each app target
    found_carthage_copy_phase = false
    project.targets.each do |target|
        target.build_phases.each do |build_phase|
            if build_phase.display_name == "Carthage Copy"
                # Adding framewok to building phase and sort
                target.frameworks_build_phase.add_file_reference(framework_reference)
                target.frameworks_build_phase.sort
                
                # Adding framework to input paths and sort
                build_phase.input_paths.push("$(SRCROOT)/" + framework_path)
                build_phase.input_paths.sort_by!(&:downcase)
                
                # Adding framework to output paths and sort
                build_phase.output_paths.push("$(BUILT_PRODUCTS_DIR)/$(FRAMEWORKS_FOLDER_PATH)/" + framework_full_name)
                build_phase.output_paths.sort_by!(&:downcase)
                
                found_carthage_copy_phase = true
            end
        end
    end
    
    if !found_carthage_copy_phase
        abort("\n'Carthage Copy' phase doesn't exist.\n".red)
    end
end

def getConfigAttributes(framework_target)
    default_configuration = framework_target.build_configuration_list[framework_target.build_configuration_list.default_configuration_name]
    base_configuration_reference = default_configuration.base_configuration_reference
    if !base_configuration_reference&.real_path.to_s.empty?
        config = Xcodeproj::Config.new(base_configuration_reference.real_path)
        config.attributes
    else
        return nil
    end
end

# Colorization
class String
    def colorize(color_code)
        "\e[#{color_code}m#{self}\e[0m"
    end
    
    def red
        colorize(31)
    end
    
    def green
        colorize(32)
    end
    
    def yellow
        colorize(33)
    end
    
    def blue
        colorize(34)
    end
    
    def light_blue
        colorize(36)
    end
end

framework_name = ARGV[0]

if !framework_name
    framework_name = prompt "Framework name (e.g. Alamofire): "
end

if framework_name.to_s.empty?
    abort("\nFramework name is required\n".red)
end

project_path = Dir['*.xcodeproj'].first
project = Xcodeproj::Project.open(project_path)

framework_project_path = Dir['Carthage/Checkouts/' + framework_name + '/*.xcodeproj'].first

if framework_project_path.to_s.empty?
    abort("\nCan't find framework project\n".red)
end

framework_shared_schemes = Xcodeproj::Project.schemes(framework_project_path)

# Get proper targets
framework_project = Xcodeproj::Project.open(framework_project_path)
framework_targets = framework_project.native_targets.select { |framework_target|
    isIOS = framework_target.common_resolved_build_setting("SUPPORTED_PLATFORMS")&.include?("iphoneos") || framework_target.platform_name == :ios
    
    # Check target configuration file also
    isIOS = isIOS || getConfigAttributes(framework_target)&.dig("SUPPORTED_PLATFORMS")&.include?("iphoneos")
    
    isFramework = framework_target.symbol_type == :framework
    isShared = framework_shared_schemes.include?(framework_target.name)
    
    isIOS && isFramework && isShared
}

all_framework_names = framework_targets.map { |framework_target|
    
    # Check target configuration file first
    framework_name = getConfigAttributes(framework_target)&.dig("PRODUCT_NAME")&.delete! ';'
    
    if framework_name.to_s.empty?
        framework_name = framework_target.common_resolved_build_setting("PRODUCT_NAME")
    end
    
    if framework_name == '$(TARGET_NAME)'
        framework_name = framework_target.name
    end
    
    framework_name
}
# TODO: Add support for 'c99extidentifier' if needed


if all_framework_names.empty?
    abort("\nFramework wasn't found\n".red)
    
elsif all_framework_names.count == 1
    addFramework(project, all_framework_names.first)
    
else
    print "\n"
    print "Available frameworks:\n"
    print all_framework_names.join("\n").blue
    print "\n"
    print "\n"
    
    framework_names_string = prompt "Please specify frameworks you want to add separating by space: "
    
    if framework_names_string.to_s.empty?
        abort("\nFramework name is required\n".red)
    end
    
    framework_names = framework_names_string.split(" ")
    framework_names.each { |framework_name| addFramework(project, framework_name) }
end

framework_cartfile = Dir['Carthage/Checkouts/' + framework_name + '/Cartfile'].first
if !framework_cartfile.to_s.empty?
    data = File.read(framework_cartfile)
    unless data.nil?
        print "\nFramework dependencies:\n"
        cmd = "grep -o -E '^git.*|^binary.*' #{framework_cartfile} | sed -E 's/(github \"|git \"|binary \")//' | sed -e 's/\".*//' | sed -e 's/^.*\\\///' -e 's/\".*//' -e 's/.json//' | sort -f"
        print (%x[ #{cmd} ]).blue
        print "\n"
        framework_names_string = prompt "Please specify dependencies you want to add separating by space (press enter to skip): "
        framework_names = framework_names_string.split(" ")
        framework_names.each { |framework_name| addFramework(project, framework_name) }
    end
end

# Save
project.save
