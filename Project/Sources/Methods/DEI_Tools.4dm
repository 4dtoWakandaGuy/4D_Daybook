//%attributes = {}
If (False:C215)
	//Project Method Name:      DEI_Tools
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_Documents; 0)
	C_BOOLEAN:C305($_bo_OpenRecover)
	C_LONGINT:C283($_l_index; $_l_Menu; $_l_MenuItem; $_l_Mode; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_RescueFolder; $_t_StructureFolder)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DEI_Tools")

If (Count parameters:C259>0)
	$_l_Mode:=$1
Else 
	$_l_Mode:=0
End if 

DB_SetAlltriggers(-1)

If ($_l_Mode=1)
	DB_SetMenuBar(""; 110)
	
	
	//Folder separator:=DB_DirSymbol 
	$_t_StructureFolder:=DB_StructureFolder
	$_t_RescueFolder:=$_t_StructureFolder+"Rescue"
	
	If (Test path name:C476($_t_RescueFolder)=Is a folder:K24:2)
		DOCUMENT LIST:C474($_t_RescueFolder; $_at_Documents)
		$_bo_OpenRecover:=Size of array:C274($_at_Documents)>0
	End if 
	
	If ($_bo_OpenRecover)
		DEI_OpenRecover
	Else 
		DEI_OpenRescue
	End if 
	
Else 
	If (Application type:C494#4D Server:K5:6)
		$_l_Menu:=Menu selected:C152\65536
		$_l_MenuItem:=Menu selected:C152%65536
		
		Case of 
			: ($_l_Menu=1)
				Case of 
					: ($_l_MenuItem=1)
						
					: ($_l_MenuItem=2)
					: ($_l_MenuItem=7)
						FLUSH CACHE:C297
					: ($_l_MenuItem=9)
						DEI_Quit
				End case 
				
			: ($_l_Menu=2)
				Case of 
					: ($_l_MenuItem=1)
						SER_ADD
					: ($_l_MenuItem=2)
						SER_GetDatafileSize
						
					: ($_l_MenuItem=4)
						DEI_OpenRescue
						
					: ($_l_MenuItem=5)
						DEI_OpenRecover
				End case 
				
			: ($_l_Menu=3)
				Case of 
					: ($_l_MenuItem=1)
						//Util_FixGremlinsNaNs
					: ($_l_MenuItem=3)
						FixZeroIDsFromUniqueFields
					: ($_l_MenuItem=4)
						ProcessIndexutility
					: ($_l_MenuItem=6)
						DEI_ReportConflicts
					: ($_l_MenuItem=7)
						DEI_PurgeConflicts
					: ($_l_MenuItem=8)
						DEI_DeleteConflicts
				End case 
				
		End case 
		
		Case of 
			: (Current user:C182="Designer")
				
				// : (Current user="Administrator")
				
				
			Else 
				
				For ($_l_index; 1; 6)
					DISABLE MENU ITEM:C150(1; $_l_index)
				End for 
				DISABLE MENU ITEM:C150(3; 3)
				
		End case 
	End if 
End if 
ERR_MethodTrackerReturn("DEI_Tools"; $_t_oldMethodName)