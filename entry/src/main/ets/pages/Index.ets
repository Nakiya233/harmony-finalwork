import { Font } from '@kit.ArkUI';
import { MyTab } from '../component/MyTabContent'
import { LeftTab } from '../component/LeftTab'

@Entry
@Component
struct Index {
  private controller: TabsController = new TabsController();
  build() {
    // 总体布局
    Column() {

      // 顶部总体布局
      Column() {
        Stack() {
          Row(){
            Text('11:04')
              .width('30%')
              .fontWeight(FontWeight.Bold)
              .margin({ left: '10%' })
            Text('BOSS 直聘')
              .fontColor('#23AFAB')
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 20 })
          }
          .width('100%')
          .height('100%')
          .linearGradient({
            angle: 180, // 从上到下
            colors: [['#00FFFFFF', 0], ['#FFFFFF', 1]]
          })

          Text()
            .width('50%')
        }
        .height('40%')
        .width('100%')
        .backgroundColor(Color.Grey)
        .linearGradient({
          // 0点方向顺时针旋转为正向角度，线性渐变起始角度的默认值为180°
          angle: 90,
          colors: [
            [0x51C7C7, 0.0], // 颜色断点1的颜色和比重，对应组件在方向上的起始位置
            [0xffccbe, 1.0],// 颜色断点2的颜色和比重，对应组件在方向上的终点位置
          ]
        })

        Row() {
          Text('鸿蒙开发工程师')
            .fontColor(Color.Black)
            .fontWeight(FontWeight.Bold)
            .fontSize(23)
            .width('50%')
            .margin({left: 10})
          Text('').width('20%')
          Row() {
            Image($r('app.media.plus'))
              .width(22)
              .aspectRatio(1)
              .fillColor(Color.Black)
              .margin({left: 8})
            Image($r('app.media.search'))
              .width(22)
              .aspectRatio(1)
              .fillColor(Color.Black)
              .margin({left: 20})
          }
        }
        .width("100%")
        .justifyContent(FlexAlign.Start)
      }
      .width('100%')
      .height('20%')

      Column() {
        Column() {
          // 顶部标签栏
          LeftTab()
            .margin({ top: -50 })
        }
      }
      .width('100%')
      .height('75%')

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
