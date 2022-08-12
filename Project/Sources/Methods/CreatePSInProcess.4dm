//%attributes = {}
If (False:C215)
	//Project Method Name:      CreatePSInProcess
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/01/2012 10:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(PS_al_FieldNumber;0)
	//ARRAY LONGINT(PS_al_Long1ID;0)
	//ARRAY LONGINT(PS_al_Long2ID;0)
	//ARRAY LONGINT(PS_al_Long3ID;0)
	//ARRAY LONGINT(PS_al_TableNumber;0)
	//ARRAY TEXT(PS_at_Function;0)
	C_BOOLEAN:C305(<>DB_bo_Exit; $_bo_Boolean1; $_bo_ProcessVisible; $8; PS_bo_DropOut)
	C_LONGINT:C283(<>DB_l_ProcessServerCreator; <>STK_l_PSProcessID; $_l_FunctionType; $_l_Long1; $_l_Long2; $_l_Long3; $_l_ProcessState; $_l_ProcessTime; $_l_RecordNumber; $_l_SizeofArray; $_l_TableNumber)
	C_LONGINT:C283($_l_UniqueProcessID; $_l_ValueNum; $_l_ValueNum2; $1; $2; $3; $5; $6; $7; PS_l_RecordID; STK_l_PSCallingProcess)
	C_POINTER:C301($_ptr_Field; $_Ptr_Table; $9)
	C_TEXT:C284($_t_BlobAsText; $_t_oldMethodName; $_t_processName; $_t_ServiceName; $_t_Type; $4)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("CreatePSInProcess")
If (Current process:C322=$1)
	$_l_TableNumber:=$2
	$_ptr_Field:=Field:C253($2; $3)
	$_l_RecordNumber:=$_ptr_Field->
	$_t_ServiceName:=$4
	$_l_Long1:=0
	$_l_Long2:=0
	$_l_Long3:=0
	$_bo_Boolean1:=False:C215
	
	$_t_BlobAsText:=""
	If (Count parameters:C259>=5)
		
		$_l_Long1:=$5
	Else 
		$_l_Long1:=0
	End if 
	If (Count parameters:C259>=6)
		
		$_l_Long2:=$6
	Else 
		$_l_Long2:=0
	End if 
	If (Count parameters:C259>=7)
		
		$_l_Long3:=$7
	Else 
		$_l_Long3:=0
	End if 
	If (Count parameters:C259>=8)
		
		$_bo_Boolean1:=$8
	Else 
		$_bo_Boolean1:=False:C215
	End if 
	If (Count parameters:C259>=9)
		
		$_t_BlobAsText:=BLOB to text:C555($9->; Mac text without length:K22:10)
	Else 
		$_t_BlobAsText:=""
		
	End if 
	While (Semaphore:C143("protectServiceCreatorVar"))
		DelayTicks(2)
	End while 
	If (<>DB_l_ProcessServerCreator=0)
		
		<>DB_l_ProcessServerCreator:=New process:C317("ProcessServices_CreateFromTrans"; 256000; "Create Process Record"; $_l_TableNumber; $_l_RecordNumber; $_t_ServiceName; $_l_Long1; $_l_Long2; $_l_Long3; $_bo_Boolean1; $_t_BlobAsText)
	Else 
		While (Semaphore:C143("PSBusy"))
			
			DelayTicks(2)
		End while 
		SET PROCESS VARIABLE:C370(<>DB_l_ProcessServerCreator; SVS_l_TableNumber; $_l_TableNumber)
		
		
		//TRACE
		SET PROCESS VARIABLE:C370(<>DB_l_ProcessServerCreator; SVS_t_ServiceName; $_t_ServiceName)
		SET PROCESS VARIABLE:C370(<>DB_l_ProcessServerCreator; SVS_l_Long1; $_l_Long1)
		SET PROCESS VARIABLE:C370(<>DB_l_ProcessServerCreator; SVS_l_Long2; $_l_Long2)
		SET PROCESS VARIABLE:C370(<>DB_l_ProcessServerCreator; SVS_l_Long3; $_l_Long3)
		SET PROCESS VARIABLE:C370(<>DB_l_ProcessServerCreator; SVS_bo_Boolean1; $_bo_Boolean1)
		SET PROCESS VARIABLE:C370(<>DB_l_ProcessServerCreator; SVS_t_BlobasText; $_t_BlobAsText)
		SET PROCESS VARIABLE:C370(<>DB_l_ProcessServerCreator; SVS_l_RecordID; $_l_RecordNumber)
		RESUME PROCESS:C320(<>DB_l_ProcessServerCreator)
		CLEAR SEMAPHORE:C144("PSBusy")
		
	End if 
	CLEAR SEMAPHORE:C144("protectServiceCreatorVar")
	
Else 
	
	
	If (Count parameters:C259>=6)
		//Open window(20;Screen height-400;120;Screen height-200;-Palette window )
		//MESSAGE("Create Process Service Record")
		//CLOSE WINDOW
		STK_l_PSCallingProcess:=$1
		If ($1>0)
			PROCESS PROPERTIES:C336($1; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
			If ($_t_processName="ValidateCurrentStock") | ("ValidateCalledoff"=$_t_processName) | ("Validate Stock"=$_t_processName) | ("Application Process"=$_t_processName) | ("SP for"+"@"=$_t_processName) | ("Service Process"=$_t_processName) | ($_t_processName="Setup Stock") | ($_t_processName="Verify Stock")
				STK_l_PSCallingProcess:=0
			End if 
		End if 
		$_Ptr_Table:=Table:C252($2)
		$_ptr_Field:=Field:C253($2; $3)
		$_t_Type:=$4
		$_l_ValueNum:=$5
		$_l_ValueNum2:=$6
		PS_l_RecordID:=0
		If (Count parameters:C259>=7)
			PS_l_RecordID:=$7
		End if 
		
		If ($_l_ValueNum>0)
			
			ProcessServices_CreateRecord($_Ptr_Table; $_ptr_Field; $_t_Type; $_l_ValueNum; $_l_ValueNum2)
		End if 
		
		//`CLOSE WINDOW
	Else 
		While (Semaphore:C143("Wait ForPS-2"))
			DelayTicks(2)
		End while 
		PS_bo_DropOut:=False:C215
		ARRAY LONGINT:C221(PS_al_TableNumber; 0)
		ARRAY LONGINT:C221(PS_al_FieldNumber; 0)
		ARRAY TEXT:C222(PS_at_Function; 0)
		ARRAY LONGINT:C221(PS_al_Long1ID; 0)
		ARRAY LONGINT:C221(PS_al_Long2ID; 0)
		ARRAY LONGINT:C221(PS_al_Long3ID; 0)
		CLEAR SEMAPHORE:C144("Wait ForPS-2")
		
		
		//While (Semaphore("Wait ForPS"))
		//DelayTicks (2)
		//End while
		Repeat 
			$_l_SizeofArray:=Size of array:C274(PS_al_TableNumber)
			If (Size of array:C274(PS_al_TableNumber)>0)
				Repeat 
					While (Semaphore:C143("Wait ForPS"))
						DelayTicks(2)
					End while 
					$_Ptr_Table:=Table:C252(PS_al_TableNumber{$_l_SizeofArray})
					$_ptr_Field:=Field:C253(PS_al_TableNumber{$_l_SizeofArray}; PS_al_FieldNumber{$_l_SizeofArray})
					$_t_Type:=PS_at_Function{$_l_SizeofArray}
					$_l_ValueNum:=PS_al_Long1ID{$_l_SizeofArray}
					$_l_ValueNum2:=PS_al_Long2ID{$_l_SizeofArray}
					PS_l_RecordID:=0
					PS_l_RecordID:=PS_al_Long3ID{$_l_SizeofArray}
					If ($_l_ValueNum>0)
						//ProcessServices_CreateRecord ($_Ptr_Table;$_ptr_Field;$type;$_l_ValueNum;$_l_ValueNum2)
					End if 
					ARRAY LONGINT:C221(PS_al_TableNumber; $_l_SizeofArray-1)
					ARRAY LONGINT:C221(PS_al_FieldNumber; $_l_SizeofArray-1)
					ARRAY TEXT:C222(PS_at_Function; $_l_SizeofArray-1)
					ARRAY LONGINT:C221(PS_al_Long1ID; $_l_SizeofArray-1)
					ARRAY LONGINT:C221(PS_al_Long2ID; $_l_SizeofArray-1)
					ARRAY LONGINT:C221(PS_al_Long3ID; $_l_SizeofArray-1)
					
					CLEAR SEMAPHORE:C144("Wait ForPS")
					DelayTicks(20)
					$_l_SizeofArray:=$_l_SizeofArray-1
				Until ($_l_SizeofArray=0)
			End if 
			DelayTicks(60)
		Until (<>DB_bo_Exit)
		<>STK_l_PSProcessID:=0
		//CLEAR SEMAPHORE("Wait ForPS")
		
		
	End if 
	
	
End if 
ERR_MethodTrackerReturn("CreatePSInProcess"; $_t_oldMethodName)