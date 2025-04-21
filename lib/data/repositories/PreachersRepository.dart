

import '../../core/PreacherModel.dart';
import '../../core/Result.dart';
import '../datasources/firebase_database_service.dart';

class PreachersRepository{

  Future<Result<List<PreacherModel>>> getPreachers() async {
    try{
      final result = await FirebaseRealTimeDB.getPreachers();
      return Result(data: result);
    } catch(e) {
      return Result(data: null, message: e.toString());
    }
  }
}



