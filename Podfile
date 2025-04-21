# Global configuration
platform :ios, '13.0'
use_frameworks!

workspace 'TestApp'

# Shared dependencies
def networkAndParsingPods
  pod 'Alamofire'
end

def commonPods
  pod 'Swinject'
end

# Main app target
target 'TestApp' do
  # Include all shared dependencies
  networkAndParsingPods
  commonPods
  
  # Add test dependencies (optional)
  target 'TestAppTests' do
    inherit! :search_paths
  end
end

# Common framework target
target 'Common' do
  project 'Common/Common'

  # Add shared dependencies used by this framework
  networkAndParsingPods
  
  target 'CommonTests' do
    inherit! :search_paths
  end
end

# ServiceItem framework target
target 'ServiceItem' do
  project 'ServiceItem/ServiceItem'

  # Add shared dependencies used by this framework
  commonPods
  
  target 'ServiceItemTests' do
    inherit! :search_paths
  end
end

# Auth framework target
target 'Auth' do
  project 'Auth/Auth'

  # Add shared dependencies used by this framework
  commonPods
  
  target 'AuthTests' do
    inherit! :search_paths
  end
end


