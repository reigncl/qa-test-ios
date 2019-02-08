# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'
# Comment the next line if you're not using Swift and don't want to use dynamic frameworks

use_frameworks!

def pods
  pod 'PKHUD'
  pod 'Swinject'
  pod 'SwinjectStoryboard'
  pod 'Moya' , '~> 11.0'
  pod 'Kingfisher'
  pod 'SwiftLint'
end

target 'wedding' do
  pods
end

target 'weddingTests' do
  pods
  pod 'Quick'
  pod 'Nimble'
end

target 'weddingUITests' do
  pods
end