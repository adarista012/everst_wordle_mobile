import 'hero_details_options.dart';

String heroDetailsOptionsToStrig(HeroDetailsOptions detail) {
  String typeDetail = '';
  switch (detail) {
    case HeroDetailsOptions.comics:
      typeDetail = 'comics';
      break;
    case HeroDetailsOptions.events:
      typeDetail = 'events';
      break;
    case HeroDetailsOptions.series:
      typeDetail = 'series';
      break;
    case HeroDetailsOptions.stories:
      typeDetail = 'stories';
      break;
  }
  return typeDetail;
}
