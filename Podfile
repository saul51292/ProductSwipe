source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '8.0'

inhibit_all_warnings!

xcodeproj 'ProductSwipe'

link_with 'ProductSwipe', 'ProductSwipe Tests'


pod 'MaveSDK'
pod 'ZLSwipeableView'

post_install do |installer|
    installer.project.targets.each do |target|
        puts target.name
    end
end