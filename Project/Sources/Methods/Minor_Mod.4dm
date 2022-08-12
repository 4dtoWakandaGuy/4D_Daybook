//%attributes = {}
If (False:C215)
	//Project Method Name:      Minor_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/06/2010 09:26
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>AutoFind; <>StartProc; $_bo_AutoFind; $_bo_InRecordListing; $6; DB_bo_InRecordListing)
	C_LONGINT:C283(<>AutoProc; <>ButtProc; <>Mod_l_MaxModules; $_l_BarProcess; $_l_FormHeight; $_l_FormWidth; $_l_PersonnelTable; $_l_TableNumber; MOD_l_CurrentModuleAccess; vAdd; vNo)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $_t_SetName; $2; $3; $4; $5; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Minor_Mod")
If (<>Mod_l_MaxModules=0)
	GET PROCESS VARIABLE:C371(-1; <>Mod_l_MaxModules; <>Mod_l_MaxModules)
End if 
//Minor_Mod
//§-----
//NG Jan 24th 2005.
//Modifiy all calls to this method in daybook to remove the 3rd parameter.
//the 3rd parameter was used to send the screen size to this method
//the concept of screen sizes was removed from the system a while ago as screens are resizable
//the 3rd parameter will now be re-used in here to allow a specific entry form to be used
// $4 can be used to pass a specific listing form.
//------
//NG Feb 2007 Modification to allow extra paramters $5=set name, $6 flag to say use set passed in $5 to

If (Count parameters:C259>=6)
	$_t_SetName:=$5
	If ($6=False:C215)
		$_t_SetName:=""
	End if 
	$_bo_AutoFind:=$6
Else 
	$_bo_AutoFind:=False:C215
	$_t_SetName:=""
End if 

<>StartProc:=False:C215
//if the user is viewing the personnel table
//i want to filter out 'deleted' records
//i expect I will add something like this to other tables
$_l_PersonnelTable:=Table:C252(->[PERSONNEL:11])
$_l_TableNumber:=Table:C252($1)


Start_Process
//DEFAULT TABLE($1->)
If (Count parameters:C259>=3)
	If ($3#"")
		FORM SET INPUT:C55($1->; $3)
		WIN_t_CurrentInputForm:=$3
	Else 
		FORM SET INPUT:C55($1->; $2+"_In")  //NG April 2004 Removed $3
		WIN_t_CurrentInputForm:=$2+"_In"
	End if 
	
Else 
	FORM SET INPUT:C55($1->; $2+" In13")  //NG April 2004 Removed $3
	WIN_t_CurrentInputForm:=$2+"_In"
End if 
If (Count parameters:C259>=4)
	If ($4#"")
		FORM SET OUTPUT:C54($1->; $4)
		WIN_t_CurrentOutputform:=$4
	Else 
		FORM SET OUTPUT:C54($1->; $2+" Out")
		WIN_t_CurrentOutputform:=$2+" Out"
	End if 
	
Else 
	FORM SET OUTPUT:C54($1->; $2+" Out")
	WIN_t_CurrentOutputform:=$2+" Out"
	
End if 

MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
If ((DB_GetModuleSettingByNUM(1)=5) & (MOD_l_CurrentModuleAccess<2))
	Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
	
Else 
	If (MOD_l_CurrentModuleAccess#3)
		READ WRITE:C146($1->)
	End if 
	vAdd:=0
	Case of 
		: (<>AutoProc=987654321)
			<>AutoProc:=0
			<>AutoFind:=False:C215
			USE NAMED SELECTION:C332("◊IA")
		: ($_bo_AutoFind) & (Count parameters:C259>=5) & ($_t_SetName#"")
			USE SET:C118($_t_SetName)
			CLEAR SET:C117($_t_SetName)
			
		Else 
			Case of 
				: ($_l_TableNumber=$_l_PersonnelTable)
					QUERY:C277($1->; [PERSONNEL:11]PersonDeleted:38#1)
					//add others here
					
				Else 
					
					ALL RECORDS:C47($1->)
			End case 
			
	End case 
	vNo:=Records in selection:C76($1->)
	Case of 
		: (vNo=0)
			//TRACE
			$_bo_InRecordListing:=DB_bo_InRecordListing
			DB_bo_InRecordListing:=True:C214
			$_l_TableNumber:=Table:C252($1)
			DB_MenuNewRecord(String:C10($_l_TableNumber))
			DB_bo_InRecordListing:=$_bo_InRecordListing
			
		: (vNo=1)
		Else 
			If (False:C215)
				
				
				FORM GET PROPERTIES:C674($1->; $2+" Out"; $_l_FormWidth; $_l_FormHeight)
				WIN_t_CurrentOutputform:=$2+" Out"
				COPY NAMED SELECTION:C331($1->; "$Selection")
				Open_Pro_Window($2; 0; 1; $1; $2+" Out")
				FS_SetFormSort(WIN_t_CurrentOutputform)
				
				
				WIn_SetFormSize(1; $1; $2+" Out")
				USE NAMED SELECTION:C332("$selection")
				
				MODIFY SELECTION:C204($1->; *)
				Close_ProWin
			Else 
				COPY NAMED SELECTION:C331($1->; "MinPreselection")
				$_l_TableNumber:=Table:C252($1)
				DBI_DisplayRecords($_l_TableNumber; "MinPreselection"; ""; 1)
				$_l_BarProcess:=Get_ProcessNumber("Modules_Palette")
				If ($_l_BarProcess>0)
					SHOW PROCESS:C325($_l_BarProcess)
					
				End if 
				If (<>ButtProc>0)
					SHOW PROCESS:C325(<>ButtProc)
				End if 
				
			End if 
	End case 
	
	UNLOAD RECORD:C212($1->)
End if 
Process_End
ERR_MethodTrackerReturn("Minor_Mod"; $_t_oldMethodName)
