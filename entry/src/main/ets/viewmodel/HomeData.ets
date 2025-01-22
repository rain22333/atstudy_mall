const classifyTitle: Resource[] = [
  $r('app.string.title_bar_homepage'),
  $r('app.string.title_bar_phone'),
  $r('app.string.title_bar_computer'),
  $r('app.string.title_bar_foods'),
  $r('app.string.title_bar_men_wear'),
  $r('app.string.title_bar_fresh'),
  $r('app.string.title_bar_furniture_kitchenware')
]

const swiperImage: Resource[] = [
  $r('app.media.ic_banner001'),
  $r('app.media.ic_banner002'),
  $r('app.media.ic_banner003'),
  $r('app.media.ic_banner004')
]


export class ActivityTitleModel {
  title?: Resource
  desc?: Resource
}

const activityTitle: ActivityTitleModel[] = [
  {
    title: $r('app.string.activity_title_all'),
    desc: $r('app.string.activity_title_all_desc')
  },
  {
    title: $r('app.string.activity_title_selected'),
    desc: $r('app.string.activity_title_selected_desc')
  },
  {
    title: $r('app.string.activity_title_new_products'),
    desc: $r('app.string.activity_title_new_products_desc')
  },
  {
    title: $r('app.string.activity_title_affordable'),
    desc: $r('app.string.activity_title_affordable_desc')
  }
]

export {  swiperImage,classifyTitle,activityTitle}
