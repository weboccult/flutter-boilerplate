import 'helper_functions/helper_functions.dart';


void main(List<String> args) async {
  ///  This function will Initialize the Project with basic Project Structure files and add required YAML files for the project.
  await _initBaseProjectWithDependencies();

}




_initBaseProjectWithDependencies() async {
  await Helper.initRequiredDependenciesToProject;
  await Helper.baseProjectStructureInit;
}