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

project_path = Dir['*.xcodeproj'].first
project = Xcodeproj::Project.open(project_path)

frameworks_reference = project["Frameworks"]
framework_reference = project["Frameworks"][framework_full_name]

if !framework_reference
    framework_name = prompt "Can not find '" + framework_name + "' framework. Please enter proper framework name (e.g. Alamofire): "
    framework_full_name = framework_name + ".framework"
    framework_path = "Carthage/Build/iOS/" + framework_full_name
    framework_reference = project["Frameworks"][framework_full_name]
end

if !framework_reference
    abort("\nFramework name is required\n".red)
end

# Enumberate each app target
project.targets.each do |target|
    target.build_phases.each do |build_phase|
        if build_phase.display_name == "Carthage Copy"
            # Deleting framework from output paths and sorting
            build_phase.output_paths.delete("$(BUILT_PRODUCTS_DIR)/$(FRAMEWORKS_FOLDER_PATH)/" + framework_full_name)
            build_phase.output_paths.sort_by!(&:downcase)
            
            # Deleting framework from input paths and sorting
            build_phase.input_paths.delete("$(SRCROOT)/" + framework_path)
            build_phase.input_paths.sort_by!(&:downcase)
            
            # Deleting framewok from building phase and sorting
            target.frameworks_build_phase.remove_file_reference(framework_reference)
            target.frameworks_build_phase.sort
        end
    end
end

# Removing from Frameworks folder and sorting
framework_reference = project["Frameworks"][framework_full_name]
framework_reference.remove_from_project
frameworks_reference.sort

# Save
project.save
