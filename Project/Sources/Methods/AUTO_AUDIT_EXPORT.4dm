//%attributes = {}
If (False:C215)
	//Project Method Name:      AUTO_AUDIT_EXPORT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2/6/10 2:03 PM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>SYS_al_ModifiedTable;0)
	//ARRAY TEXT(<>SYS_at_ModifiedText;0)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_Indexed)
	C_LONGINT:C283($_l_BlobSize; $_l_CompressedSize; $_l_CurrentSize; $_l_Delay; $_l_ExpandedSize; $_l_FieldLength; $_l_Index; $_l_MaxSize; $_l_Next; $_l_Offset; $_l_Retries)
	C_LONGINT:C283($_l_TableNumber; $_l_TablePosition; $1)
	C_TEXT:C284($_t_Modifiedtext; $_t_oldMethodName; $_t_ProcedureName; $_t_SemaphoreName; $_t_StructurePath; $_t_TableName; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AUTO_AUDIT_EXPORT")

$_l_TableNumber:=$1
$_t_TableName:=Table name:C256($1)
Repeat 
	
	If ($_l_TableNumber>0)
		$_l_Retries:=0
		While (Semaphore:C143("$writeAudit"))
			$_l_Retries:=$_l_Retries+1
			DelayTicks(2*(1+$_l_Retries))
		End while 
		$_l_TablePosition:=Find in array:C230(<>SYS_al_ModifiedTable; $_l_TableNumber)
		If ($_l_TablePosition<0)
			
			$_l_TablePosition:=Find in array:C230(<>SYS_al_ModifiedTable; 0)
			If ($_l_TablePosition<0)
				
				INSERT IN ARRAY:C227(<>SYS_al_ModifiedTable; Size of array:C274(<>SYS_al_ModifiedTable)+1; 1)
				INSERT IN ARRAY:C227(<>SYS_at_ModifiedText; Size of array:C274(<>SYS_at_ModifiedText)+1; 1)
				<>SYS_al_ModifiedTable{Size of array:C274(<>SYS_al_ModifiedTable)}:=$_l_TableNumber
			Else 
				<>SYS_al_ModifiedTable{$_l_TablePosition}:=$_l_TableNumber
			End if 
		End if 
		CLEAR SEMAPHORE:C144("$writeAudit")
	End if 
	$_l_Next:=Find in array:C230(<>SYS_al_ModifiedTable; $_l_TableNumber)
	If ($_l_Next>0)
		$_t_Modifiedtext:=<>SYS_at_ModifiedText{$_l_Next}
		$_l_Retries:=0
		While (Semaphore:C143("$writeAudit"))
			$_l_Retries:=$_l_Retries+1
			DelayTicks(2*(1+$_l_Retries))
		End while 
		<>SYS_at_ModifiedText{$_l_Next}:=""
		<>SYS_al_ModifiedTable{$_l_Next}:=-1
		CLEAR SEMAPHORE:C144("$writeAudit")
		$_l_MaxSize:=5000
		If (Count parameters:C259>=2)
			$_t_SemaphoreName:="AUDIT"+$_t_TableName
			$_l_Delay:=2
			While (Semaphore:C143($_t_SemaphoreName))
				DelayTicks(2*$_l_Delay)
				$_l_Delay:=$_l_Delay*2
				If ($_l_Delay>(30*60))
					$_l_Delay:=60
				End if 
				
			End while 
			$_t_StructurePath:=StructureFilePath  //Mon, Dec 18, 2006 balinderwalia: changed to work for engine version
			
			
			//Folder separator:=DB_DirSymbol 
			
			For ($_l_Index; Length:C16($_t_StructurePath); 1; -1)
				If ($_t_StructurePath[[$_l_Index]]=Folder separator:K24:12)
					$_t_StructurePath:=Substring:C12($_t_StructurePath; 1; $_l_Index)
					$_l_Index:=0
				End if 
			End for 
			$_t_StructurePath:=$_t_StructurePath+"DATAAUDIT"+"_"+$_t_TableName
			
			$_l_FieldLength:=0
			$_bo_Indexed:=False:C215
			
			
			QUERY:C277([DATA_AUDITS:102]; [DATA_AUDITS:102]DOCUMENT_NAME:5="DATAAUDIT"+"_"+$_t_TableName; *)
			QUERY:C277([DATA_AUDITS:102];  & ; [DATA_AUDITS:102]END_DATE:4=!00-00-00!)
			If (Records in selection:C76([DATA_AUDITS:102])=0)
				CREATE RECORD:C68([DATA_AUDITS:102])
				[DATA_AUDITS:102]TABLE_NUMBER:2:=$1
				[DATA_AUDITS:102]START_DATE:3:=Current date:C33(*)
				[DATA_AUDITS:102]DOCUMENT_NAME:5:="DATAAUDIT"+"_"+$_t_TableName
				DB_SaveRecord(->[DATA_AUDITS:102])
				AA_CheckFileUnlocked(->[DATA_AUDITS:102]X_ID:1)
			Else 
				$_l_BlobSize:=0
				$_l_BlobSize:=BLOB size:C605([DATA_AUDITS:102]DATA:6)
				If ($_l_BlobSize>$_l_MaxSize)
					//DONT WRITE ANY MORE TO THE DOCUMENT
					[DATA_AUDITS:102]END_DATE:4:=Current date:C33(*)
					DB_SaveRecord(->[DATA_AUDITS:102])
					AA_CheckFileUnlocked(->[DATA_AUDITS:102]X_ID:1)
					UNLOAD RECORD:C212([DATA_AUDITS:102])
					//START A  NEW ONE
					CREATE RECORD:C68([DATA_AUDITS:102])
					[DATA_AUDITS:102]TABLE_NUMBER:2:=$1
					[DATA_AUDITS:102]START_DATE:3:=Current date:C33(*)
					[DATA_AUDITS:102]DOCUMENT_NAME:5:="DATAAUDIT"+"_"+$_t_TableName
					DB_SaveRecord(->[DATA_AUDITS:102])
					AA_CheckFileUnlocked(->[DATA_AUDITS:102]X_ID:1)
				End if 
			End if 
			//NOW WE SEND THE EXISTING DATA  TO THE DOCUMENT.
			$_l_CompressedSize:=0
			$_l_ExpandedSize:=0
			$_l_CurrentSize:=0
			$_l_Offset:=0
			
			BLOB PROPERTIES:C536([DATA_AUDITS:102]DATA:6; $_l_CompressedSize; $_l_ExpandedSize; $_l_CurrentSize)
			If ($_l_CompressedSize>0)
				EXPAND BLOB:C535([DATA_AUDITS:102]DATA:6)
			End if 
			$_t_Modifiedtext:=Char:C90(13)+$_t_Modifiedtext
			TEXT TO BLOB:C554($_t_Modifiedtext; [DATA_AUDITS:102]DATA:6; 3; *)
			//NOW  WRITE A NEW VERSION OF THE DOCUMENT TO DISK
			//  $_ti_DocumentRef:=Create document($_t_StructurePath;"TEXT")
			//Close DocUMENT($_ti_DocumentRef)
			// BLOB TO DOCUMENT($_t_StructurePath;[DATA_AUDITS]DATA)
			COMPRESS BLOB:C534([DATA_AUDITS:102]DATA:6; 2)
			
			DB_SaveRecord(->[DATA_AUDITS:102])
			AA_CheckFileUnlocked(->[DATA_AUDITS:102]X_ID:1)
			UNLOAD RECORD:C212([DATA_AUDITS:102])
			CLEAR SEMAPHORE:C144($_t_SemaphoreName)
			
		End if 
		
		
	Else 
		DelayTicks(5*60)
		
		//something is checking for this process
		$_t_ProcedureName:="ExportAudit_"+String:C10($_l_TableNumber)
		$_l_Retries:=0
		While (Semaphore:C143("$Start"+$_t_ProcedureName))
			$_l_Next:=10  //so we dont break out
			$_l_Retries:=$_l_Retries+1
			DelayTicks(2*(1+$_l_Retries))
		End while 
		CLEAR SEMAPHORE:C144("$Start"+$_t_ProcedureName)
		
	End if 
	PAUSE PROCESS:C319(Current process:C322)
	
	//If (Count parameters>=3)  `CALLED FROM A DELETION
	//$_l_Next:=-1
	//End if
	If (<>SYS_bo_QuitCalled)
		$_l_Next:=-1
	End if 
	
	
Until ($_l_Next<0)
FLUSH CACHE:C297
ERR_MethodTrackerReturn("AUTO_AUDIT_EXPORT"; $_t_oldMethodName)
