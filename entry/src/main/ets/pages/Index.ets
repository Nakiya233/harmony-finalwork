import { Font } from '@kit.ArkUI';
import { MyTab } from './TabContent'

@Entry
@Component
struct Index {
  private controller: TabsController = new TabsController();
  @State arr: Array<string> = ['1','2','3','4','5','6'];
  build() {
    // 总体布局
    Column() {
      // 顶部总体布局
      Column() {
        Row() {
          Text('11:04')
            .width('30%')
            .margin({left: '10%', top: '3%'})
          Text('BOSS 直聘')
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
          Text('推荐')
          Text('附近')
          Text('最新')
          Text('北京')
          Text('筛选')
        }
        .width('100%')
      }
      .width('100%')
      .height('20%')

      // 中间
      Column() {

        List() {
          ForEach(this.arr, (item: string) => {
            ListItem() {
              Text(item.toString())
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .size({ height: 100, width: "100%" })
            }.margin(10)
            .borderRadius(10)
            .backgroundColor("#FFFFFFFF")
          }, (item: string) => item)
            .onMove((from: number, to: number) => {
              // 以下两行代码是为了确保拖拽后屏幕上组件的顺序与数组arr中每一项的顺序保持一致。
              // 若注释以下两行，第一步拖拽排序，第二步在arr末尾插入一项，触发ForEach渲染，此时屏上组件的顺序会跟数组arr中每一项的顺序一致，而不是维持第一步拖拽后的顺序，意味着拖拽排序在ForEach渲染后失效了。
              let tmp = this.arr.splice(from, 1);
              this.arr.splice(to, 0, tmp[0]);
            })
        }
      }
      .width('100%')
      .height('75%')
      .backgroundColor('#F6F5F6')

      // 底部标签栏
      Column(){
        MyTab()
      }
      .height('8%')
      .width('100%')
      .backgroundColor(Color.Brown)


    }
    .height('100%')
    .width('100%')
  }
}
