//%attributes = {}
If (False:C215)
	//Project Method Name:      Personnel_PDF_addMenu
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
	//ARRAY LONGINT(PER_al_PageNos;0)
	//ARRAY TEXT(DOC_at_PDF995Path;0)
	//ARRAY TEXT(PDF_at_995DocsDirPath;0)
	//ARRAY TEXT(PDF_at_MachineNames;0)
	//ARRAY TEXT(PDS_at_DaybookUsers;0)
	//ARRAY TEXT(PER_at_Pages;0)
	C_BOOLEAN:C305($_bo_UseronMachineFound; $_l_MachineIndexsWindowsBool)
	C_LONGINT:C283($_l_CurrentRow; $_l_Index; $_l_MachineIndex; $_l_MachineIndexElement; $_l_MachineRow; $_l_Offset; $_l_SizeofArray; $1)
	C_TEXT:C284($_t_MachineName; $_t_oldMethodName; DOC_t_PDF995Path; PDF_t_995DocDirPath; PDF_t_MachineName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Personnel_PDF_addMenu")

$_l_Offset:=$1

$_l_MachineIndexsWindowsBool:=(Is macOS:C1572=False:C215)

If (($_l_MachineIndexsWindowsBool) | (User in group:C338(Current user:C182; "administrator")) | (User in group:C338(Current user:C182; "Designer")))
	DB_MenuAction("Section"; "PDF Configuration"; 2; "")
	
	$_l_MachineIndexElement:=Size of array:C274(PER_at_Pages)+1
	
	INSERT IN ARRAY:C227(PER_at_Pages; $_l_MachineIndexElement; 1)
	INSERT IN ARRAY:C227(PER_al_PageNos; $_l_MachineIndexElement; 1)
	
	PER_at_Pages{$_l_MachineIndexElement}:="PDF Configuration"
	PER_al_PageNos{$_l_MachineIndexElement}:=11
	
	Personnel_PDF_LoadPrefs([PERSONNEL:11]Initials:1)
	//NG I am going to delete the default values as they are about as much use as a chocoloate soldier
	$_l_MachineRow:=Find in array:C230(PDF_at_MachineNames; "Default Windows")
	If ($_l_MachineRow>0)
		DELETE FROM ARRAY:C228(PDF_at_MachineNames; $_l_MachineRow)
		DELETE FROM ARRAY:C228(PDS_at_DaybookUsers; $_l_MachineRow)
		DELETE FROM ARRAY:C228(PDF_at_995DocsDirPath; $_l_MachineRow)
		DELETE FROM ARRAY:C228(DOC_at_PDF995Path; $_l_MachineRow)
		DELETE FROM ARRAY:C228(PDF_abo_MachineIsWindows; $_l_MachineRow)
	End if 
	$_l_MachineRow:=Find in array:C230(PDF_at_MachineNames; "Default MacOs")
	If ($_l_MachineRow>0)
		DELETE FROM ARRAY:C228(PDF_at_MachineNames; $_l_MachineRow)
		DELETE FROM ARRAY:C228(PDS_at_DaybookUsers; $_l_MachineRow)
		DELETE FROM ARRAY:C228(PDF_at_995DocsDirPath; $_l_MachineRow)
		DELETE FROM ARRAY:C228(DOC_at_PDF995Path; $_l_MachineRow)
		DELETE FROM ARRAY:C228(PDF_abo_MachineIsWindows; $_l_MachineRow)
	End if 
	//The concept of a default path is pointless!!!
	If (Size of array:C274(PDF_at_MachineNames)=0)
		
		
		//``
		
		
		If ($_l_MachineIndexsWindowsBool)
			$_l_MachineIndexElement:=1
			ARRAY TEXT:C222(DOC_at_PDF995Path; $_l_MachineIndexElement)
			ARRAY TEXT:C222(PDF_at_995DocsDirPath; $_l_MachineIndexElement)  //bwalia 20060926
			ARRAY TEXT:C222(PDF_at_MachineNames; $_l_MachineIndexElement)
			ARRAY TEXT:C222(PDS_at_DaybookUsers; $_l_MachineIndexElement)
			ARRAY BOOLEAN:C223(PDF_abo_MachineIsWindows; $_l_MachineIndexElement)
			SORT ARRAY:C229(PDF_at_MachineNames; PDS_at_DaybookUsers; PDF_at_995DocsDirPath; DOC_at_PDF995Path)
			PDF_at_MachineNames{$_l_MachineIndexElement}:=Current machine:C483
			PDS_at_DaybookUsers{$_l_MachineIndexElement}:=[PERSONNEL:11]Initials:1
			DOC_at_PDF995Path{$_l_MachineIndexElement}:="C:\\Program Files\\pdf995\\res\\pdf995.ini"
			PDF_abo_MachineIsWindows{$_l_MachineIndexElement}:=True:C214
			PDF_at_995DocsDirPath{$_l_MachineIndexElement}:=DB_GetDocumentPath  //29/10/08 v631b120c -kmw, removed system folder prefix (hadn't realised DB_GetDocumentPath does this anyway)
			
			PDF_at_MachineNames:=1
			DOC_at_PDF995Path:=PDF_at_MachineNames
		Else   //bwalia 20060926
			$_l_MachineIndexElement:=1
			ARRAY TEXT:C222(DOC_at_PDF995Path; $_l_MachineIndexElement)
			ARRAY TEXT:C222(PDF_at_995DocsDirPath; $_l_MachineIndexElement)  //bwalia 20060926
			ARRAY TEXT:C222(PDF_at_MachineNames; $_l_MachineIndexElement)
			ARRAY TEXT:C222(PDS_at_DaybookUsers; $_l_MachineIndexElement)
			ARRAY BOOLEAN:C223(PDF_abo_MachineIsWindows; $_l_MachineIndexElement)
			SORT ARRAY:C229(PDF_at_MachineNames; PDS_at_DaybookUsers; PDF_at_995DocsDirPath; DOC_at_PDF995Path; PDF_abo_MachineIsWindows)
			PDF_at_MachineNames{$_l_MachineIndexElement}:=Current machine:C483
			PDS_at_DaybookUsers{$_l_MachineIndexElement}:=[PERSONNEL:11]Initials:1
			DOC_at_PDF995Path{$_l_MachineIndexElement}:=""
			PDF_at_995DocsDirPath{$_l_MachineIndexElement}:=DB_GetDocumentPath
			PDF_at_MachineNames:=1
			DOC_at_PDF995Path:=PDF_at_MachineNames
		End if 
		
		
		
		//bwalia 20060926
	End if 
	
	
	PDF_t_MachineName:=PDF_at_MachineNames{DOC_at_PDF995Path}
	If ($_l_MachineIndexsWindowsBool)
		DOC_t_PDF995Path:=DOC_at_PDF995Path{DOC_at_PDF995Path}
	Else 
		OBJECT SET VISIBLE:C603(DOC_t_PDF995Path; False:C215)
		OBJECT SET VISIBLE:C603(*; "oIniFileLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "bSetTarget"; False:C215)
	End if 
	If ($_l_MachineIndexsWindowsBool)  //bwalia 20060926
		$_t_MachineName:=Current machine:C483  //bwalia 20060926
	Else 
		$_t_MachineName:=Current machine:C483  //""  `bwalia 20060926, machine name put back in NG october 2007
	End if 
	
	
	
	PDF_t_995DocDirPath:=PDF_at_995DocsDirPath{DOC_at_PDF995Path}  //bwalia 20060926
	
	
	SORT ARRAY:C229(PDF_at_MachineNames; PDS_at_DaybookUsers; PDF_at_995DocsDirPath; DOC_at_PDF995Path; PDF_abo_MachineIsWindows)
	$_l_SizeofArray:=Size of array:C274(PDF_at_MachineNames)
	ARRAY TEXT:C222(PDF_at_MachineNames; $_l_SizeofArray)
	ARRAY TEXT:C222(PDS_at_DaybookUsers; $_l_SizeofArray)
	ARRAY TEXT:C222(PDF_at_995DocsDirPath; $_l_SizeofArray)
	ARRAY TEXT:C222(DOC_at_PDF995Path; $_l_SizeofArray)
	ARRAY BOOLEAN:C223(PDF_abo_MachineIsWindows; $_l_SizeofArray)
	If ($_l_SizeofArray>0)
		For ($_l_Index; $_l_SizeofArray; 1; -1)
			If (PDF_at_MachineNames{$_l_Index}="") & (PDS_at_DaybookUsers{$_l_Index}="") & (PDF_at_995DocsDirPath{$_l_Index}="") & (DOC_at_PDF995Path{$_l_Index}="")
				DELETE FROM ARRAY:C228(PDF_at_MachineNames; $_l_Index)
				DELETE FROM ARRAY:C228(PDS_at_DaybookUsers; $_l_Index)
				DELETE FROM ARRAY:C228(PDF_at_995DocsDirPath; $_l_Index)
				DELETE FROM ARRAY:C228(DOC_at_PDF995Path; $_l_Index)
				DELETE FROM ARRAY:C228(PDF_abo_MachineIsWindows; $_l_Index)
				If (DOC_at_PDF995Path>=$_l_Index)
					DOC_at_PDF995Path:=DOC_at_PDF995Path-1
				End if 
			End if 
			
		End for 
	End if 
	$_bo_UseronMachineFound:=False:C215
	If ($_t_MachineName#"")
		$_l_CurrentRow:=0
		$_l_MachineRow:=Find in array:C230(PDF_at_MachineNames; $_t_MachineName)
		If ($_l_MachineRow>0)
			For ($_l_MachineIndex; $_l_MachineRow; Size of array:C274(PDF_at_MachineNames))
				If (PDF_at_MachineNames{$_l_MachineIndex}=$_t_MachineName) & (PDS_at_DaybookUsers{$_l_MachineIndex}=[PERSONNEL:11]Initials:1)
					$_bo_UseronMachineFound:=True:C214
					$_l_CurrentRow:=$_l_MachineIndex
				End if 
			End for 
		End if 
		If ($_bo_UseronMachineFound=False:C215) & ($_l_MachineRow>0)
			For ($_l_MachineIndex; $_l_MachineRow; Size of array:C274(PDF_at_MachineNames))
				If (PDF_at_MachineNames{$_l_MachineIndex}=$_t_MachineName) & (PDS_at_DaybookUsers{$_l_MachineIndex}="")
					$_bo_UseronMachineFound:=True:C214
					PDS_at_DaybookUsers{$_l_MachineIndex}:=[PERSONNEL:11]Initials:1
					$_l_CurrentRow:=$_l_MachineIndex
				End if 
			End for 
		End if 
		If ($_l_MachineRow=-1) | (Not:C34($_bo_UseronMachineFound))
			$_l_MachineIndexElement:=Size of array:C274(PDF_at_MachineNames)+1
			INSERT IN ARRAY:C227(PDF_at_MachineNames; $_l_MachineIndexElement; 1)
			PDF_at_MachineNames{$_l_MachineIndexElement}:=$_t_MachineName
			INSERT IN ARRAY:C227(DOC_at_PDF995Path; $_l_MachineIndexElement; 1)
			INSERT IN ARRAY:C227(PDF_at_995DocsDirPath; $_l_MachineIndexElement; 1)  //bwalia 20060926
			INSERT IN ARRAY:C227(PDS_at_DaybookUsers; $_l_MachineIndexElement; 1)  //bwalia 20060926
			
			INSERT IN ARRAY:C227(PDF_abo_MachineIsWindows; $_l_MachineIndexElement; 1)
			If ($_l_MachineIndexsWindowsBool)
				PDF_abo_MachineIsWindows{$_l_MachineIndexElement}:=True:C214
			Else 
				PDF_abo_MachineIsWindows{$_l_MachineIndexElement}:=False:C215
			End if 
			If ($_l_MachineIndexsWindowsBool)
				DOC_at_PDF995Path{$_l_MachineIndexElement}:="C:\\Program Files\\pdf995\\res\\pdf995.ini"
				PDF_at_995DocsDirPath{$_l_MachineIndexElement}:=DB_GetDocumentPath  //29/10/08 v631b120c -kmw, removed system folder prefix (hadn't realised DB_GetDocumentPath does this anyway)
			Else   //bwalia 20060926
				If (Application type:C494=4D Remote mode:K5:5)
					//PDF_at_995DocsDirPath{$_l_MachineIndexElement}:=PathFromPathName (Application file)
				Else 
					//PDF_at_995DocsDirPath{$_l_MachineIndexElement}:=PathFromPathName (Structure file)
				End if 
				PDF_at_995DocsDirPath{$_l_MachineIndexElement}:=DB_GetDocumentPath
			End if 
			PDF_at_MachineNames:=$_l_MachineIndexElement
			DOC_at_PDF995Path:=PDF_at_MachineNames
			PDF_t_MachineName:=PDF_at_MachineNames{PDF_at_MachineNames}
			
		End if 
		If ($_l_CurrentRow>0)
			//********************************************************* 28/10/08 v631b120b - kmw **********************************************************
			//Changed to simply set PDF_at_MachineNames which is checked later...
			//... by by new call to Personnel_setInterface. So now it should basically...
			//... mimic as though the user had selected this item manually...
			//... which is more robust in my opinion (in that we now have less places...
			//...where we have to remember to keep arrays in sync with each other).
			//(IN ANY REGARD THERE WAS A BUG WITH THE WAY IT WAS DOING IT BEFORE...setting machine name array but nothing else caused problems)
			PDF_at_MachineNames:=$_l_CurrentRow
			//DOC_at_PDF995Path:=$_l_CurrentRow
			//PDF_t_MachineName:=PDF_at_MachineNames{DOC_at_PDF995Path}
			//****************************************************************************************************************************************************
		End if 
	End if 
	
End if 
//********************************************************* 28/10/08 v631b120b - kmw **********************************************************
//Changed to simply call Personnel_setInterface. So now it should basically...
//... mimic as though the user had selected this item manually...
//... which is more robust in my opinion (in that we now have less places...
//...where we have to remember to keep arrays in sync with each other).

Personnel_setInterface

ERR_MethodTrackerReturn("Personnel_PDF_addMenu"; $_t_oldMethodName)
