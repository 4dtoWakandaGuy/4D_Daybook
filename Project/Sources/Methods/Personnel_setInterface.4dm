//%attributes = {}
If (False:C215)
	//Project Method Name:      Personnel_setInterface
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PDF_abo_MachineIsWindows;0)
	//ARRAY TEXT(DOC_at_PDF995Path;0)
	//ARRAY TEXT(PDF_at_995DocsDirPath;0)
	//ARRAY TEXT(PDF_at_MachineNames;0)
	C_BOOLEAN:C305($_bo_isWIndows)
	C_LONGINT:C283(bSetPDFOutput; bSetTarget)
	C_TEXT:C284($_t_oldMethodName; DOC_t_PDF995Path; PDF_t_995DocDirPath; PDF_t_MachineName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Personnel_setInterface")

$_bo_isWIndows:=(Is macOS:C1572=False:C215)

PDF_t_MachineName:=PDF_at_MachineNames{PDF_at_MachineNames}  //kmw added 27/10/08 v631b120b
DOC_at_PDF995Path:=PDF_at_MachineNames
PDF_at_995DocsDirPath:=PDF_at_MachineNames  //kmw added 27/10/08 v631b120b -not needed but just in case keep all these arrays in step
DOC_t_PDF995Path:=DOC_at_PDF995Path{DOC_at_PDF995Path}
PDF_t_995DocDirPath:=PDF_at_995DocsDirPath{DOC_at_PDF995Path}  //bwalia 20060926

If (PDF_abo_MachineIsWindows{DOC_at_PDF995Path}=True:C214)
	
	OBJECT SET VISIBLE:C603(DOC_t_PDF995Path; True:C214)
Else 
	OBJECT SET VISIBLE:C603(DOC_t_PDF995Path; False:C215)
End if 

If (PDF_t_MachineName#Current machine:C483)
	OBJECT SET VISIBLE:C603(bSetTarget; False:C215)
	OBJECT SET VISIBLE:C603(bSetPDFOutput; False:C215)
Else 
	OBJECT SET VISIBLE:C603(bSetPDFOutput; True:C214)
	If ($_bo_isWIndows)
		OBJECT SET VISIBLE:C603(bSetTarget; True:C214)
	Else 
		//SET ENTERABLE(DOC_t_PDF995Path;False)
		//removced above line kmw  27/10/08 v631b120b - (changed to allow edit of windows doc path from a mac)
		OBJECT SET VISIBLE:C603(bSetTarget; False:C215)
	End if 
End if 
//</code>

//<return>
//$0 :=
//</return>
ERR_MethodTrackerReturn("Personnel_setInterface"; $_t_oldMethodName)
