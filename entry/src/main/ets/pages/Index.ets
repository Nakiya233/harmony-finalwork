@Entry
@Component
struct Index {
  build() {
    Column() {
      Column() {
        Row() {
          Text('11:04')
            .width('30%')
            .margin({left: '10%', top: '3%'})
          Text('BOSS 直聘')
            .margin({right: 20})
          Text()
            .width('50%')
        }
        .justifyContent(FlexAlign.Start)
        Row() {
          Text('鸿蒙开发工程师')
          Button()
          Button()
        }
        .width("100%")
        .justifyContent(FlexAlign.Start)
        .margin({top: '3%'})
        Row() {
          Button('推荐')
          Button('附近')
          Button('最新')
          Text('北京')
          Text('筛选')
        }
        .width('100%')
      }
      .width('100%')
      .height('20%')
    }
  }
}