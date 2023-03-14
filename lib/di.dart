import 'package:get/get.dart';
import 'package:simulate/controllers/quiz_controller.dart';

void configure()
{
  Get.put<QuizController>(QuizController());
}