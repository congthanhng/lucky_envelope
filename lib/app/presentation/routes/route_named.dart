enum RouteNamed{
  splash('splash','/'),
  home('home','home'),
  withdraw('withdraw','withdraw/:setId'),
  config('config','config/:setId')
  ;

  const RouteNamed(this.named,this.path);
  final String named;
  final String path;
}