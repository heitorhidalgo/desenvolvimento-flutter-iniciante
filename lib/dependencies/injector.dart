import 'package:get_it/get_it.dart';
import '../controllers/pessoa_controller.dart';

void injector(){
  GetIt.instance.registerSingleton<PessoaController>(PessoaController());
}