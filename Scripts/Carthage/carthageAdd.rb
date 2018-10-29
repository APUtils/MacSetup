require 'xcodeproj'

# Input
def prompt(*args)
    print(*args)
    STDIN.gets.strip
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

framework_full_name = framework_name + ".framework"
framework_path = "Carthage/Build/iOS/" + framework_full_name

if !File.exist?(framework_path)
    framework_name = prompt "Can not find '" + framework_name + "' framework. Please enter proper framework name (e.g. Alamofire): "
    framework_full_name = framework_name + ".framework"
    framework_path = "Carthage/Build/iOS/" + framework_full_name
end

if !File.exist?(framework_path)
    abort("\nFramework doesn't exist. Please check Carthage/Build/iOS/ folder and find the right framework name.\n".red)
end

project_path = Dir['*.xcodeproj'].first
project = Xcodeproj::Project.open(project_path)

# Adding to Frameworks folder and sorting
frameworks_group = project["Frameworks"]
framework_reference = frameworks_group.new_file framework_path
frameworks_group.sort

# Enumberate each app target
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
        end
    end
end

# Save
project.save
