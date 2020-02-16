import 'config.dart';

class MainProd extends Config {
  MainProd() : super(EnvType.production);
}

void main(){
  MainProd();
}