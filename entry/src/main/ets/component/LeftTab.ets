
import { componentUtils } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { PromptAction } from '@kit.ArkUI';
import { Item, itemList } from '../model/Item'


@Entry
@Component
struct LeftTab {
  @State tabArray: Array<number> = [0, 1, 2];
  @State tabStrs: Array<string> = ['推荐', '附近', '最新']
  @State currentIndex: number = 0;
  @State indicatorLeftMargin: number = 0;
  @State indicatorWidth: number = 0;
  @State tabsWidth: number = 0;
  private controller: TabsController = new TabsController();
  private tabLeftOffset: number = 4;
  private animationDuration: number = 300;
  private itemFontColor: string = '#5B5A5A'

  private  arr: Array<string> = ['1','2','3','4','5','6'];

  // [Start LeftTab_builder_tab]
  @Builder
  tab(tabName: string, _tabItem: number, tabIndex: number) {
    Row() {
      Text(tabName)
        .fontSize(18)
        .lineHeight(22)
        .fontColor(tabIndex === this.currentIndex ? '#ff000000' : '#B8B8B8')
        .id(tabIndex.toString())
        .onAreaChange((_, newValue: Area) => {
          if (this.currentIndex === tabIndex && (this.indicatorLeftMargin === 0 || this.indicatorWidth === 0)) {
            let positionX: number;
            let width: number = Number.parseFloat(newValue.width.toString());
            if (newValue.position.x !== undefined) {
              positionX = Number.parseFloat(newValue.position.x?.toString())
              this.indicatorLeftMargin = Number.isNaN(positionX) ? 0 : positionX;
            }
            this.indicatorWidth = width;
          }
        })
    }
    .justifyContent(FlexAlign.Center)
    .constraintSize({ minWidth: 35 })
    .width(50)
    .height(35)
    .onClick(() => {
      this.controller.changeIndex(tabIndex);
      this.currentIndex = tabIndex;
    })
  }
  // [End LeftTab_builder_tab]

  build() {
    Column() {
      // [Start LeftTab_stack]
      Stack({ alignContent: Alignment.TopStart }) {
        // The text of tab.
        Row() {
          ForEach(this.tabStrs, (item: string, index: number) => {
            this.tab(item, index, index);
          }, (item: string, _index: number) => item.toString())
          Blank()
          Text('北京')
            .width(50)
            .height(28)
            .fontSize(14)
            .textAlign(TextAlign.Center)
            .margin({ right: 6 })
            .borderRadius(3)
            .backgroundColor('#F6F5F5')
            .fontColor('#B8B8B8')
          Text('筛选')
            .width(50)
            .height(28)
            .fontSize(14)
            .textAlign(TextAlign.Center)
            .margin({ right: 12 })
            .borderRadius(3)
            .backgroundColor('#F6F5F5')
            .fontColor('#B8B8B8')
        }
        .justifyContent(FlexAlign.Start)
        .width('100%')


      }
      .height(56)
      .margin({ left: this.tabLeftOffset })
      // [End LeftTab_stack]

      Tabs({ controller: this.controller }) {
        ForEach(this.tabArray, (item: number) => {
          TabContent() {
            Row() {
              List() {
                ForEach(itemList, (item: Item, index: number) => {
                  ListItem() {
                    Column() {
                      Row() {
                        Row(){
                          Text(item.position)
                            .fontWeight(FontWeight.Bold)
                            .fontSize(18)
                          Blank()
                            .width('30%')
                        }
                        .width('68%')
                        Text(item.salary)
                          .fontColor('#ff08adae')
                      }
                      .justifyContent(FlexAlign.Start)
                      .margin({top: 10, left: 20})
                      .width('100%')

                      Row() {
                        Text(item.company)
                          .fontSize(14)
                          .fontColor(this.itemFontColor)
                        Text(item.invest)
                          .fontSize(14)
                          .fontColor(this.itemFontColor)
                          .margin({left: 5})
                        Text(item.number)
                          .fontSize(14)
                          .fontColor(this.itemFontColor)
                          .margin({left: 5})
                      }
                      .width('100%')
                      .justifyContent(FlexAlign.Start)
                      .margin({top: 10, left: 20})

                      Row({space: 5}) {
                        ForEach(item.tags, (tag: string, index: number) => {
                          Text(tag)
                            .fontColor(this.itemFontColor)
                            .backgroundColor('#fff5f3f3')
                            .borderRadius(2)
                            .width('17%')
                            .height('17%')
                            .textOverflow({ overflow: TextOverflow.Ellipsis })
                            .textAlign(TextAlign.Center)
                            .wordBreak(2)
                            .maxLines(1)
                        })
                      }
                      .width('100%')
                      .margin({top: 10, left: 20})

                      Row() {
                        Image(item.icon)
                          .width(24)
                          .aspectRatio(1)
                          .borderRadius(20)
                          .margin({top: 10, left: 12})

                        Text(item.name)
                          .fontSize(14)
                          .margin({top: 10, left: 8})

                        Blank()

                        Text(item.location)
                          .fontColor('#ACB9B9')
                          .fontSize(14)
                          .margin({top: 10, right: 20})
                      }
                      .width('100%')

                    }
                    .width('100%')
                    .height('21%')
                    .borderRadius(8)
                  }
                  .onClick(() => {
                    let uiContext = this.getUIContext();
                    let promptAction: PromptAction = uiContext.getPromptAction();
                    try {
                      promptAction.showDialog({
                        buttons: [
                          {
                            text: '查看详情',
                            color: '#000000'
                          }
                        ]
                      }, (err, data) => {
                        if (err) {
                          console.error('showDialog err: ' + err);
                          return;
                        }
                        console.info('showDialog success callback, click button: ' + data.index);
                      });
                    } catch (error) {
                    }
                  })
                  .margin(6)
                  .borderRadius(6)
                  .backgroundColor("#FFFFFFFF")
                }, (item: string) => item)
                  .onMove((from: number, to: number) => {
                    // 以下两行代码是为了确保拖拽后屏幕上组件的顺序与数组arr中每一项的顺序保持一致。
                    // 若注释以下两行，第一步拖拽排序，第二步在arr末尾插入一项，触发ForEach渲染，此时屏上组件的顺序会跟数组arr中每一项的顺序一致，而不是维持第一步拖拽后的顺序，意味着拖拽排序在ForEach渲染后失效了。
                    let tmp = this.arr.splice(from, 1);
                    this.arr.splice(to, 0, tmp[0]);
                  })
              }
              // Text(this.pageStr + ' ' + item + ' ' + this.contentStr);
            }
            .backgroundColor('#F6F5F6')
            .justifyContent(FlexAlign.Center)
            .width('100%')
            .height('100%')
          }
        }, (item: number, _index: number) => item.toString())
      }
      .onAreaChange((_, newValue: Area) => {
        this.tabsWidth = Number.parseFloat(newValue.width.toString());
      })
      .barWidth('100%')
      .barHeight(0)
      .width('100%')
      .height('100%')
      .animationDuration(this.animationDuration)
      // swipe by touch.
      // [Start on_gesture_swipe]
      .onGestureSwipe((index: number, event: TabsAnimationEvent) => {
        let currentIndicator = this.getCurrentIndicatorInfo(index, event);
        this.currentIndex = currentIndicator.index;
        this.indicatorLeftMargin = currentIndicator.left;
        this.indicatorWidth = currentIndicator.width;
      })
      // swipe by click tab.
      // [Start on_animation_start]
      .onAnimationStart((_index: number, targetIndex: number, _event: TabsAnimationEvent) => {
        this.currentIndex = targetIndex;
        let targetIndexInfo = this.getTextInfo(targetIndex);
        this.startAnimateTo(this.animationDuration, targetIndexInfo.left, targetIndexInfo.width);
      })
    }
    .height('100%')
  }

  private getCurrentIndicatorInfo(index: number, event: TabsAnimationEvent): Record<string, number> {
    let nextIndex = index;
    if (index > 0 && event.currentOffset > 0) {
      // swipe to left.
      nextIndex--;
    } else if (index < this.tabArray.length && event.currentOffset > 0) {
      // swipe to right.
      nextIndex++;
    } else {
      // error condition.
      hilog.info(0x0000, 'leftTab', 'the index is out of boundary: %{public}s', index);
    }
    let indexInfo = this.getTextInfo(index);
    let nextIndexInfo = this.getTextInfo(index);

    let swipeRatio = Math.abs(event.currentOffset / this.tabsWidth);
    let currentIndex = swipeRatio > 0.5 ? nextIndex : index;
    let currentIndicatorLeft: number = indexInfo.left + (nextIndexInfo.left - indexInfo.left) * swipeRatio;
    let currentIndicatorWidth: number = indexInfo.width + (nextIndexInfo.width - indexInfo.width) * swipeRatio;
    return { 'index': currentIndex, 'left': currentIndicatorLeft, 'width': currentIndicatorWidth };
  }
  // [End on_gesture_swipe]

  private getTextInfo(index: number): Record<string, number> {
    let modePosition: componentUtils.ComponentInfo = this.getUIContext().getComponentUtils().getRectangleById(index.toString());
    return { 'left': this.getUIContext().px2vp(modePosition.windowOffset.x), 'width': this.getUIContext().px2vp(modePosition.size.width) };
  }

  private startAnimateTo(duration: number, leftMargin: number, width: number) {
    this.getUIContext().animateTo({
      duration: duration,
      curve: Curve.Linear,
      iterations: 1,
      playMode: PlayMode.Normal,
    }, () => {
      this.indicatorLeftMargin = leftMargin;
      this.indicatorWidth = width;
    })
  }
}
// [End on_animation_start]

export { LeftTab }