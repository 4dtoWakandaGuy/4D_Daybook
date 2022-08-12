//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_CODE_GENERATOR
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/10/2013 07:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_FormNames; 0)
	ARRAY TEXT:C222($_at_Paths; 0)
	C_LONGINT:C283($_l_FormsIndex; $_l_FormsObjectsIndex)
	C_POINTER:C301($_ptr_VarorFieldPointer)
	C_TEXT:C284($_t_MethodText; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_CODE_GENERATOR"; Form event code:C388)

//So the  plan here is to pick up a  document for the table-that will give us the field names for the table in question
//get the form names for the table and then the objects for each form
//then create a document with the 'base' objects for the model
//The outputs will be to a text file-one to create the excel sheet from i will then pick up those files to work on.

//The code output format is

$_t_MethodText:=""
$_t_MethodText:=$_t_MethodText+"$0:=False"+Char:C90(13)
$_t_MethodText:=$_t_MethodText+Char:C90(13)
$_t_MethodText:=$_t_MethodText+Char:C90(13)
$_t_MethodText:=$_t_MethodText+"$cAction:="+Char:C90(34)+Char:C90(34)+Char:C90(13)
$_t_MethodText:=$_t_MethodText+Char:C90(13)
$_t_MethodText:=$_t_MethodText+"$bCheck:=False"+Char:C90(13)
$_t_MethodText:=$_t_MethodText+Char:C90(13)
$_t_MethodText:=$_t_MethodText+"$bTableEdit:=False  // whether a model is editting"+Char:C90(13)
$_t_MethodText:=$_t_MethodText+Char:C90(13)
$_t_MethodText:=$_t_MethodText+"$bData:=False"+Char:C90(13)
$_t_MethodText:=$_t_MethodText+Char:C90(13)
$_t_MethodText:=$_t_MethodText+"If (Count parameters>=1)"+Char:C90(13)
$_t_MethodText:=$_t_MethodText+Char:C90(13)
$_t_MethodText:=$_t_MethodText+"$cAction:=$1"+Char:C90(13)
$_t_MethodText:=$_t_MethodText+Char:C90(13)
$_t_MethodText:=$_t_MethodText+"End if "+Char:C90(13)
$_t_MethodText:=$_t_MethodText+Char:C90(13)
$_t_MethodText:=$_t_MethodText+"If (Position("+Char:C90(34)+"CHECK"+Char:C90(34)+";$cAction)>0)"+Char:C90(13)
$_t_MethodText:=$_t_MethodText+Char:C90(13)
$_t_MethodText:=$_t_MethodText+"$bCheck:=True"+Char:C90(13)
$_t_MethodText:=$_t_MethodText+Char:C90(13)
$_t_MethodText:=$_t_MethodText+"End if "+Char:C90(13)
$_t_MethodText:=$_t_MethodText+Char:C90(13)
$_t_MethodText:=$_t_MethodText+Char:C90(13)
$_t_MethodText:=$_t_MethodText+"If (Position("+Char:C90(34)+"data"+Char:C90(34)+";cAPI_Type)<1)"
$_t_MethodText:=$_t_MethodText+Char:C90(13)
$_t_MethodText:=$_t_MethodText+"$bData:=True"
$_t_MethodText:=$_t_MethodText+Char:C90(13)
$_t_MethodText:=$_t_MethodText+"End if"
$_t_MethodText:=$_t_MethodText+"Case of"
//Here we get the form names and we are going to create a 'base' view of each on
//we will coerse model structure names based on some rules.
//we will also coerse model objects based on some rules



//For ($FormSetups;1;Size of array($aTableForms)

//$_t_MethodText:=$_t_MethodText+": (cAPI_ModelStructure="+Char(34)+$aTableForms{$FormSetups}+Char(34)+")"+Char(13)

$_t_MethodText:=$_t_MethodText+"$bTableEdit:=True"  //<--note this only gets set for some
//Get the form objects here
//i believe we can use
//TRACE
ARRAY TEXT:C222($_at_Paths; 0)
ARRAY TEXT:C222($_at_FormNames; 0)

FORM GET NAMES:C1167([COMPANIES:2]; $_at_FormNames)
For ($_l_FormsIndex; 1; Size of array:C274($_at_FormNames))
	METHOD GET PATHS FORM:C1168([COMPANIES:2]; $_at_Paths; $_at_FormNames{$_l_FormsIndex}; *)
	For ($_l_FormsObjectsIndex; 1; Size of array:C274($_at_Paths))
		
		$_ptr_VarorFieldPointer:=OBJECT Get pointer:C1124(Object named:K67:5; $_at_Paths{$_l_FormsObjectsIndex})  //-> Function result
	End for 
End for 
//to resolve the path name
//API_Model_Field_Arrays("ADD";->[Job Header]Job Number)
ERR_MethodTrackerReturn("DB_CODE_GENERATOR"; $_t_oldMethodName)