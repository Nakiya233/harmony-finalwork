@Component
struct MyTab {
  @State tabItemColor: string = '#B8B8B8';
  @State selectedTabItemColor: string = '#13AAA7';
  @State currentIndex: number = 0;
  @State selectedIndex: number = 0;
  private controller: TabsController = new TabsController();

  @Builder tabBuilder(index: number, title: string, image: Resource) {
    Column() {
      if(index == 1 || index == 3) {
        Badge({
          value: '',
          position: {x: 19, y: -1},
          style: { badgeSize: 9, badgeColor: '#FA2A2D' }
        }) {
          Image(image)
            .width(24)
            .height(24)
              // .margin({ bottom: 4 })
            .objectFit(ImageFit.Contain)
            .fillColor(this.selectedIndex == index ? this.selectedTabItemColor : this.tabItemColor)
        }
        .width(24)
        .height(24)
        .margin({ bottom: 4 })
      }
      else if(index == 2) {
        Badge({
          count: 2,
          position: {x: 18, y: -3},
          style: { badgeSize: 16, badgeColor: '#FA2A2D' }
        }) {
          Image(image)
            .width(24)
            .height(24)
              // .margin({ bottom: 4 })
            .objectFit(ImageFit.Contain)
            .fillColor(this.selectedIndex == index ? this.selectedTabItemColor : this.tabItemColor)
        }
        .width(24)
        .height(24)
        .margin({ bottom: 4 })
      } else {

        Image(image)
          .width(24)
          .height(24)
          .margin({ bottom: 4 })
          .objectFit(ImageFit.Contain)
          .fillColor(this.selectedIndex == index ? this.selectedTabItemColor : this.tabItemColor)
      }

      Text(title)
        .fontColor(this.selectedIndex === index ? this.selectedTabItemColor : this.tabItemColor)
        .fontSize(10)
        .fontWeight(500)
        .lineHeight(14)
    }.width('100%')
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
        TabContent() {

        }.tabBar(this.tabBuilder(0, '职位', $r('app.media.work_position')))

        TabContent() {

        }.tabBar(this.tabBuilder(1, '有了', $r('app.media.book')))

        TabContent() {

        }.tabBar(this.tabBuilder(2, '消息', $r('app.media.message')))

        TabContent() {

        }.tabBar(this.tabBuilder(3, '我的', $r('app.media.my')))
      }
      .vertical(false)
      .barHeight(56)
      .onChange((index: number) => {
        // currentIndex控制TabContent显示页签
        this.currentIndex = index;
        this.selectedIndex = index;
      })
      .onAnimationStart((index: number, targetIndex: number, event: TabsAnimationEvent) => {
        if (index === targetIndex) {
          return;
        }
        // selectedIndex控制自定义TabBar内Image和Text颜色切换
        this.selectedIndex = targetIndex;
      })
      .width('100%')
      .height('100%')
      .backgroundColor('#FEFFFF')
    }.width('100%')
  }
}

export { MyTab }