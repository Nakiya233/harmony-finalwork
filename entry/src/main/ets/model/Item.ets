
export class Item {
  position: string;
  salary: string;
  company: string;
  invest: string;
  number: string;
  tags: string[];
  icon: Resource;
  name: string;
  location: string;


  constructor(
    position: string,
    salary: string,
    company: string,
    invest: string,
    number: string,
    tags: string[],
    icon: Resource,
    name: string,
    location: string
  ) {
    this.position = position;
    this.salary = salary;
    this.company = company;
    this.invest = invest;
    this.number = number;
    this.tags = tags;
    this.icon = icon;
    this.name = name;
    this.location = location;
  }
}

const itemList: Item[] = [
  new Item(
    '鸿蒙开发工程师',
    '55-75K·16薪',
    '小红书',
    'D轮及以上',
    '1000-9999人',
    ['5-10年', '本科', '客户端', '应用程序开发', '根据产品需求'],
    $r("app.media.startIcon"),
    '肖冰',
    '朝阳区 亚运村'
  ),
  new Item(
    '前端开发工程师',
    '30-50K·15薪',
    '字节跳动',
    'C轮',
    '10000人以上',
    ['3-5年', '本科', '前端', 'React/Vue', '高并发'],
    $r("app.media.startIcon"),
    '李雷',
    '海淀区 中关村'
  ),
  new Item(
    '后端开发工程师',
    '40-60K·16薪',
    '腾讯',
    '上市公司',
    '10000人以上',
    ['5-10年', '硕士', '后端', 'Java', '微服务架构'],
    $r("app.media.startIcon"),
    '王刚',
    '南山区 科技园'
  ),
  new Item(
    'Android开发工程师',
    '35-55K·14薪',
    '美团',
    'B轮',
    '5000-10000人',
    ['3-5年', '本科', 'Android', 'Kotlin', '移动端开发'],
    $r("app.media.startIcon"),
    '赵敏',
    '浦东新区 张江'
  ),
  new Item(
    'iOS开发工程师',
    '38-58K·16薪',
    '阿里巴巴',
    '上市公司',
    '10000人以上',
    ['5-10年', '本科', 'iOS', 'Swift', 'App开发'],
    $r("app.media.startIcon"),
    '孙悟空',
    '西湖区 文三路'
  ),
  new Item(
    '测试开发工程师',
    '28-45K·13薪',
    '京东',
    'D轮及以上',
    '10000人以上',
    ['3-5年', '本科', '测试', '自动化', '性能测试'],
    $r("app.media.startIcon"),
    '唐僧',
    '亦庄开发区'
  ),
  new Item(
    '算法工程师',
    '60-90K·16薪',
    '百度',
    '上市公司',
    '10000人以上',
    ['5-10年', '博士', '算法', '深度学习', '推荐系统'],
    $r("app.media.startIcon"),
    '猪八戒',
    '海淀区 上地'
  )
]

export { itemList }