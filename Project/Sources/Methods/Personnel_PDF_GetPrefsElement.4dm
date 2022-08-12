//%attributes = {}
If (False:C215)
	//Project Method Name:      Personnel_PDF_GetPrefsElement
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/12/2009 10:10
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
	//ARRAY TEXT(PDS_at_DaybookUsers;0)
	C_BOOLEAN:C305($_bo_IsWIndows; $_bo_Modified; $_bo_UserOnMachineFound)
	C_LONGINT:C283($_l_ArraySize; $_l_Element; $_l_MachineIndex; $_l_MachinePosition)
	C_REAL:C285($0)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_MachineName; $_t_oldMethodName; $_t_PersonInitials; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Personnel_PDF_GetPrefsElement")

$_bo_UserOnMachineFound:=False:C215
$_t_MachineName:=Current machine:C483
$_bo_Modified:=False:C215
$_bo_IsWIndows:=(Is macOS:C1572=False:C215)
If (Count parameters:C259>=1)
	$_t_PersonInitials:=$1
Else 
	$_t_PersonInitials:=<>PER_t_CurrentUserInitials
End if 

If ($_t_MachineName#"")
	$_l_Element:=0
	$_l_MachinePosition:=Find in array:C230(PDF_at_MachineNames; $_t_MachineName)
	If ($_l_MachinePosition>0)
		For ($_l_MachineIndex; $_l_MachinePosition; Size of array:C274(PDF_at_MachineNames))
			If (PDF_at_MachineNames{$_l_MachineIndex}=$_t_MachineName) & (PDS_at_DaybookUsers{$_l_MachineIndex}=$_t_PersonInitials)
				$_bo_UserOnMachineFound:=True:C214
				$_l_Element:=$_l_MachineIndex
				$0:=$_l_MachineIndex
			End if 
		End for 
	End if 
	If ($_bo_UserOnMachineFound=False:C215) & ($_l_MachinePosition>0)
		For ($_l_MachineIndex; $_l_MachinePosition; Size of array:C274(PDF_at_MachineNames))
			If (PDF_at_MachineNames{$_l_MachineIndex}=$_t_MachineName) & (PDS_at_DaybookUsers{$_l_MachineIndex}="")
				$_bo_UserOnMachineFound:=True:C214
				PDS_at_DaybookUsers{$_l_MachineIndex}:=$_t_PersonInitials
				$_l_Element:=$_l_MachineIndex
				$_bo_Modified:=True:C214
				$0:=$_l_MachineIndex
			End if 
		End for 
	End if 
	If ($_l_MachinePosition=-1) | (Not:C34($_bo_UserOnMachineFound))
		
		$_l_ArraySize:=Size of array:C274(PDF_at_MachineNames)+1
		//``
		ARRAY TEXT:C222(DOC_at_PDF995Path; $_l_ArraySize)
		ARRAY TEXT:C222(PDF_at_995DocsDirPath; $_l_ArraySize)  //bwalia 20060926
		ARRAY TEXT:C222(PDF_at_MachineNames; $_l_ArraySize)
		ARRAY TEXT:C222(PDS_at_DaybookUsers; $_l_ArraySize)
		ARRAY BOOLEAN:C223(PDF_abo_MachineIsWindows; $_l_ArraySize)
		//``
		INSERT IN ARRAY:C227(PDF_at_MachineNames; $_l_ArraySize; 1)
		PDF_at_MachineNames{$_l_ArraySize}:=$_t_MachineName
		INSERT IN ARRAY:C227(DOC_at_PDF995Path; $_l_ArraySize; 1)
		INSERT IN ARRAY:C227(PDF_at_995DocsDirPath; $_l_ArraySize; 1)  //bwalia 20060926
		INSERT IN ARRAY:C227(PDS_at_DaybookUsers; $_l_ArraySize; 1)  //bwalia 20060926
		
		INSERT IN ARRAY:C227(PDF_abo_MachineIsWindows; $_l_ArraySize; 1)
		If ($_bo_IsWIndows)
			PDF_abo_MachineIsWindows{$_l_ArraySize}:=True:C214
		Else 
			PDF_abo_MachineIsWindows{$_l_ArraySize}:=False:C215
		End if 
		$0:=$_l_ArraySize
		$_bo_Modified:=True:C214
		If ($_bo_IsWIndows)
			DOC_at_PDF995Path{$_l_ArraySize}:="C:\\Program Files\\pdf995\\res\\pdf995.ini"
			PDF_at_995DocsDirPath{$_l_ArraySize}:=DB_GetDocumentPath  //29/10/08 v631b120c -kmw, removed system folder prefix (hadn't realised DB_GetDocumentPath does this anyway)
			
		Else   //bwalia 20060926
			If (Application type:C494=4D Remote mode:K5:5)
				//PDF_at_995DocsDirPath{$_l_ArraySize}:=PathFromPathName (Application file)
			Else 
				//PDF_at_995DocsDirPath{$_l_ArraySize}:=PathFromPathName (Structure file)
			End if 
			PDF_at_995DocsDirPath{$_l_ArraySize}:=DB_GetDocumentPath
		End if 
	End if 
	
	If ($_bo_Modified)
		Personnel_PDF_SavePrefs($_t_PersonInitials)
		
	End if 
End if 
ERR_MethodTrackerReturn("Personnel_PDF_GetPrefsElement"; $_t_oldMethodName)