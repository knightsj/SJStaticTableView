

Pod::Spec.new do |s|

  s.name         = "SJStaticTableView"
  s.version      = "1.0.3"
  s.summary      = "SJStaticTableView can be used to establish ViewControllers which contain static tableview such as setting page and userinfo page."
  s.homepage     = "https://github.com/knightsj/SJStaticTableView"
  s.license      = "MIT"
  s.author       = { "Sun Shijie" => "ssjlife0111@163.com" }
  s.source       = { :git => "https://github.com/knightsj/SJStaticTableView.git", :tag => "#{s.version}" }
  s.platform     = :ios, '6.0'
  s.requires_arc = true
  s.source_files = 'SJStaticTableViewComponent/**/*.{h,m}'
  s.resource     = 'SJStaticTableViewComponent/Resources/arrow@2x.png'
end
