Pod::Spec.new do |s|
    s.name         = 'ViewControllerTipView'
    s.version      = '0.0.1'
    s.summary      = 'Provide status displayingUI to UIViewController'
    s.homepage     = 'https://github.com/taojigu/ViewContontrollerStatusTip'
    s.license      = 'MIT'
    s.authors      = {'Gujitao' => 'taojigu@163.com'}
    s.platform     = :ios, '6.0'
    s.source       = {:git => 'https://github.com/taojigu/ViewContontrollerStatusTip.git', :tag => s.version}
    s.source_files = 'Class/**/*.{h,m}'
    s.requires_arc = true
    s.dependency     'Masonry'
    #s.dependency    'MJRefresh'
    #s.dependency    'AFNetworking','~>3.2.0'
    #s.dependency    'Reachability','~>3.2'
end
