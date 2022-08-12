//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_UpdateDiaryRelations
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/04/2010 13:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index; $_l_RecordCount; $_l_RecordID; $1)
	C_REAL:C285($_l_DeNormalised)
	C_TEXT:C284($_t_oldMethodName; $_t_TableID)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_UpdateDiaryRelations")
//with version 6.2 a new table has been added to enable relations from the diary to anything.
//this method can be called in 2 ways.
//with no parameters it will update a selection of diary records to populate the new table
//with a parameter-diary id
//it will update just one record(which means it can be called as a process service via the trigger

//[DIARY]Call Code²
//[DIARY]Company Code²
//[DIARY]Contact Code²

//[DIARY]Job Code²
//[DIARY]Order Code²
//[DIARY]Product Code
//[DIARY]Stage Code
If (Count parameters:C259=0)
	CREATE SET:C116([DIARY:12]; "Update")
	$_l_RecordCount:=Records in selection:C76([DIARY:12])
	For ($_l_Index; 1; $_l_RecordCount)
		USE SET:C118("Update")
		GOTO SELECTED RECORD:C245([DIARY:12]; $_l_Index)
		If ([DIARY:12]x_ID:50>0)
			
			If ([DIARY:12]Call_Code:25#"")
				QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Call_Code:4=[DIARY:12]Call_Code:25)
				If (Records in selection:C76([SERVICE_CALLS:20])>0)
					If ([SERVICE_CALLS:20]x_ID:27=0)
						READ WRITE:C146([SERVICE_CALLS:20])
						LOAD RECORD:C52([SERVICE_CALLS:20])
						[SERVICE_CALLS:20]x_ID:27:=AA_GetNextID(->[SERVICE_CALLS:20]x_ID:27)
						DB_SaveRecord(->[SERVICE_CALLS:20])
					End if 
					$_l_RecordID:=[SERVICE_CALLS:20]x_ID:27
					
					$_t_TableID:=String:C10(Table:C252(->[SERVICE_CALLS:20]); "0000")
					$_t_TableID:="1"+$_t_TableID+(String:C10($_l_RecordID; "000000000"))
					$_l_DeNormalised:=Num:C11($_t_TableID)
					QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
					QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRelationNUM:2=$_l_DeNormalised)
					If (Records in selection:C76([xDiaryRelations:137])=0)
						CREATE RECORD:C68([xDiaryRelations:137])
						[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
						[xDiaryRelations:137]xRecordID:4:=[SERVICE_CALLS:20]x_ID:27
						[xDiaryRelations:137]xTableNUM:3:=Table:C252(->[SERVICE_CALLS:20])
						[xDiaryRelations:137]XRelationNUM:2:=$_l_DeNormalised
						SAVE RECORD:C53([xDiaryRelations:137])
						
					End if 
					UNLOAD RECORD:C212([SERVICE_CALLS:20])
				End if 
				
			End if 
			If ([DIARY:12]Company_Code:1#"")
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[DIARY:12]Company_Code:1)
				If (Records in selection:C76([COMPANIES:2])>0)
					If ([COMPANIES:2]x_ID:63=0)
						READ WRITE:C146([COMPANIES:2])
						LOAD RECORD:C52([COMPANIES:2])
						[COMPANIES:2]x_ID:63:=AA_GetNextID(->[COMPANIES:2]x_ID:63)
						DB_SaveRecord(->[COMPANIES:2])
					End if 
					$_l_RecordID:=[COMPANIES:2]x_ID:63
					
					$_t_TableID:=String:C10(Table:C252(->[COMPANIES:2]); "0000")
					$_t_TableID:="1"+$_t_TableID+(String:C10($_l_RecordID; "000000000"))
					$_l_DeNormalised:=Num:C11($_t_TableID)
					QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
					QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRelationNUM:2=$_l_DeNormalised)
					If (Records in selection:C76([xDiaryRelations:137])=0)
						CREATE RECORD:C68([xDiaryRelations:137])
						[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
						[xDiaryRelations:137]xRecordID:4:=[COMPANIES:2]x_ID:63
						[xDiaryRelations:137]xTableNUM:3:=Table:C252(->[COMPANIES:2])
						[xDiaryRelations:137]XRelationNUM:2:=$_l_DeNormalised
						SAVE RECORD:C53([xDiaryRelations:137])
						
					End if 
					UNLOAD RECORD:C212([COMPANIES:2])
					
					
				End if 
				
			End if 
			If ([DIARY:12]Contact_Code:2#"")
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[DIARY:12]Contact_Code:2)
				If (Records in selection:C76([CONTACTS:1])>0)
					If ([CONTACTS:1]x_ID:33=0)
						READ WRITE:C146([CONTACTS:1])
						LOAD RECORD:C52([CONTACTS:1])
						[CONTACTS:1]x_ID:33:=AA_GetNextID(->[CONTACTS:1]x_ID:33)
						DB_SaveRecord(->[CONTACTS:1])
					End if 
					$_l_RecordID:=[CONTACTS:1]x_ID:33
					
					$_t_TableID:=String:C10(Table:C252(->[CONTACTS:1]); "0000")
					$_t_TableID:="1"+$_t_TableID+(String:C10($_l_RecordID; "000000000"))
					$_l_DeNormalised:=Num:C11($_t_TableID)
					QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
					QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRelationNUM:2=$_l_DeNormalised)
					If (Records in selection:C76([xDiaryRelations:137])=0)
						CREATE RECORD:C68([xDiaryRelations:137])
						[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
						[xDiaryRelations:137]xRecordID:4:=[CONTACTS:1]x_ID:33
						[xDiaryRelations:137]xTableNUM:3:=Table:C252(->[CONTACTS:1])
						[xDiaryRelations:137]XRelationNUM:2:=$_l_DeNormalised
						SAVE RECORD:C53([xDiaryRelations:137])
						
					End if 
					UNLOAD RECORD:C212([CONTACTS:1])
					
					
				End if 
				
			End if 
			
			If ([DIARY:12]Job_Code:19#"")
				QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=[DIARY:12]Job_Code:19)
				If (Records in selection:C76([JOBS:26])>0)
					If ([JOBS:26]x_ID:49=0)
						READ WRITE:C146([JOBS:26])
						LOAD RECORD:C52([JOBS:26])
						[JOBS:26]x_ID:49:=AA_GetNextID(->[JOBS:26]x_ID:49)
						DB_SaveRecord(->[JOBS:26])
					End if 
					$_l_RecordID:=[JOBS:26]x_ID:49
					
					$_t_TableID:=String:C10(Table:C252(->[JOBS:26]); "0000")
					$_t_TableID:="1"+$_t_TableID+(String:C10($_l_RecordID; "000000000"))
					$_l_DeNormalised:=Num:C11($_t_TableID)
					QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
					QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRelationNUM:2=$_l_DeNormalised)
					If (Records in selection:C76([xDiaryRelations:137])=0)
						CREATE RECORD:C68([xDiaryRelations:137])
						[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
						[xDiaryRelations:137]xRecordID:4:=[JOBS:26]x_ID:49
						[xDiaryRelations:137]xTableNUM:3:=Table:C252(->[JOBS:26])
						[xDiaryRelations:137]XRelationNUM:2:=$_l_DeNormalised
						DB_SaveRecord(->[JOBS:26])
						
					End if 
					UNLOAD RECORD:C212([JOBS:26])
					
					
				End if 
				
			End if 
			If ([DIARY:12]Order_Code:26#"")
				QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[DIARY:12]Order_Code:26)
				If (Records in selection:C76([ORDERS:24])>0)
					If ([JOBS:26]x_ID:49=0)
						READ WRITE:C146([ORDERS:24])
						LOAD RECORD:C52([ORDERS:24])
						[ORDERS:24]x_ID:58:=AA_GetNextID(->[ORDERS:24]x_ID:58)
						DB_SaveRecord(->[ORDERS:24])
					End if 
					$_l_RecordID:=[ORDERS:24]x_ID:58
					
					$_t_TableID:=String:C10(Table:C252(->[ORDERS:24]); "0000")
					$_t_TableID:="1"+$_t_TableID+(String:C10($_l_RecordID; "000000000"))
					$_l_DeNormalised:=Num:C11($_t_TableID)
					QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
					QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRelationNUM:2=$_l_DeNormalised)
					If (Records in selection:C76([xDiaryRelations:137])=0)
						CREATE RECORD:C68([xDiaryRelations:137])
						[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
						[xDiaryRelations:137]xRecordID:4:=[ORDERS:24]x_ID:58
						[xDiaryRelations:137]xTableNUM:3:=Table:C252(->[ORDERS:24])
						[xDiaryRelations:137]XRelationNUM:2:=$_l_DeNormalised
						SAVE RECORD:C53([ORDERS:24])
						
					End if 
					UNLOAD RECORD:C212([ORDERS:24])
					
					
				End if 
				
			End if 
			If ([DIARY:12]Product_Code:13#"")
				QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[DIARY:12]Product_Code:13)
				If (Records in selection:C76([PRODUCTS:9])>0)
					If ([JOBS:26]x_ID:49=0)
						READ WRITE:C146([PRODUCTS:9])
						LOAD RECORD:C52([PRODUCTS:9])
						[PRODUCTS:9]X_ID:43:=AA_GetNextID(->[PRODUCTS:9]X_ID:43)
						DB_SaveRecord(->[PRODUCTS:9])
					End if 
					$_l_RecordID:=[PRODUCTS:9]X_ID:43
					
					$_t_TableID:=String:C10(Table:C252(->[PRODUCTS:9]); "0000")
					$_t_TableID:="1"+$_t_TableID+(String:C10($_l_RecordID; "000000000"))
					$_l_DeNormalised:=Num:C11($_t_TableID)
					QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
					QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRelationNUM:2=$_l_DeNormalised)
					If (Records in selection:C76([xDiaryRelations:137])=0)
						CREATE RECORD:C68([xDiaryRelations:137])
						[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
						[xDiaryRelations:137]xRecordID:4:=[PRODUCTS:9]X_ID:43
						[xDiaryRelations:137]xTableNUM:3:=Table:C252(->[PRODUCTS:9])
						[xDiaryRelations:137]XRelationNUM:2:=$_l_DeNormalised
						SAVE RECORD:C53([PRODUCTS:9])
						
					End if 
					UNLOAD RECORD:C212([PRODUCTS:9])
					
					
				End if 
				
			End if 
			If ([DIARY:12]Stage_Code:21#"")
				QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Stage_Code:2=[DIARY:12]Stage_Code:21)
				If (Records in selection:C76([JOB_STAGES:47])>0)
					If ([JOB_STAGES:47]x_ID:54=0)
						READ WRITE:C146([JOB_STAGES:47])
						LOAD RECORD:C52([JOB_STAGES:47])
						[JOB_STAGES:47]x_ID:54:=AA_GetNextID(->[JOB_STAGES:47]x_ID:54)
						DB_SaveRecord(->[JOB_STAGES:47])
					End if 
					$_l_RecordID:=[JOB_STAGES:47]x_ID:54
					
					$_t_TableID:=String:C10(Table:C252(->[JOB_STAGES:47]); "0000")
					$_t_TableID:="1"+$_t_TableID+(String:C10($_l_RecordID; "000000000"))
					$_l_DeNormalised:=Num:C11($_t_TableID)
					QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
					QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRelationNUM:2=$_l_DeNormalised)
					If (Records in selection:C76([xDiaryRelations:137])=0)
						CREATE RECORD:C68([xDiaryRelations:137])
						[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
						[xDiaryRelations:137]xRecordID:4:=[JOB_STAGES:47]x_ID:54
						[xDiaryRelations:137]xTableNUM:3:=Table:C252(->[JOB_STAGES:47])
						[xDiaryRelations:137]XRelationNUM:2:=$_l_DeNormalised
						SAVE RECORD:C53([JOB_STAGES:47])
						
					End if 
					UNLOAD RECORD:C212([JOB_STAGES:47])
					
					
				End if 
				
			End if 
			
		End if 
		
	End for 
Else 
	If ([DIARY:12]x_ID:50#$1)
		READ ONLY:C145([DIARY:12])
		QUERY:C277([DIARY:12]; [DIARY:12]x_ID:50=$1)
	End if 
	
	If ([DIARY:12]x_ID:50>0)
		
		
		If ([DIARY:12]Call_Code:25#"")
			QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Call_Code:4=[DIARY:12]Call_Code:25)
			If (Records in selection:C76([SERVICE_CALLS:20])>0)
				If ([SERVICE_CALLS:20]x_ID:27=0)
					READ WRITE:C146([SERVICE_CALLS:20])
					LOAD RECORD:C52([SERVICE_CALLS:20])
					[SERVICE_CALLS:20]x_ID:27:=AA_GetNextID(->[SERVICE_CALLS:20]x_ID:27)
					DB_SaveRecord(->[SERVICE_CALLS:20])
				End if 
				$_l_RecordID:=[SERVICE_CALLS:20]x_ID:27
				
				$_t_TableID:=String:C10(Table:C252(->[SERVICE_CALLS:20]); "0000")
				$_t_TableID:="1"+$_t_TableID+(String:C10($_l_RecordID; "000000000"))
				$_l_DeNormalised:=Num:C11($_t_TableID)
				QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
				QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRelationNUM:2=$_l_DeNormalised)
				If (Records in selection:C76([xDiaryRelations:137])=0)
					CREATE RECORD:C68([xDiaryRelations:137])
					[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
					[xDiaryRelations:137]xRecordID:4:=[SERVICE_CALLS:20]x_ID:27
					[xDiaryRelations:137]xTableNUM:3:=Table:C252(->[SERVICE_CALLS:20])
					[xDiaryRelations:137]XRelationNUM:2:=$_l_DeNormalised
					SAVE RECORD:C53([xDiaryRelations:137])
					
				End if 
				UNLOAD RECORD:C212([SERVICE_CALLS:20])
			End if 
			
		End if 
		If ([DIARY:12]Company_Code:1#"")
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[DIARY:12]Company_Code:1)
			If (Records in selection:C76([COMPANIES:2])>0)
				If ([COMPANIES:2]x_ID:63=0)
					READ WRITE:C146([COMPANIES:2])
					LOAD RECORD:C52([COMPANIES:2])
					[COMPANIES:2]x_ID:63:=AA_GetNextID(->[COMPANIES:2]x_ID:63)
					DB_SaveRecord(->[COMPANIES:2])
				End if 
				$_l_RecordID:=[COMPANIES:2]x_ID:63
				
				$_t_TableID:=String:C10(Table:C252(->[COMPANIES:2]); "0000")
				$_t_TableID:="1"+$_t_TableID+(String:C10($_l_RecordID; "000000000"))
				$_l_DeNormalised:=Num:C11($_t_TableID)
				QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
				QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRelationNUM:2=$_l_DeNormalised)
				If (Records in selection:C76([xDiaryRelations:137])=0)
					CREATE RECORD:C68([xDiaryRelations:137])
					[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
					[xDiaryRelations:137]xRecordID:4:=[COMPANIES:2]x_ID:63
					[xDiaryRelations:137]xTableNUM:3:=Table:C252(->[COMPANIES:2])
					[xDiaryRelations:137]XRelationNUM:2:=$_l_DeNormalised
					SAVE RECORD:C53([xDiaryRelations:137])
					
				End if 
				UNLOAD RECORD:C212([COMPANIES:2])
				
				
			End if 
			
		End if 
		If ([DIARY:12]Contact_Code:2#"")
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[DIARY:12]Contact_Code:2)
			If (Records in selection:C76([CONTACTS:1])>0)
				If ([CONTACTS:1]x_ID:33=0)
					READ WRITE:C146([CONTACTS:1])
					LOAD RECORD:C52([CONTACTS:1])
					[CONTACTS:1]x_ID:33:=AA_GetNextID(->[CONTACTS:1]x_ID:33)
					DB_SaveRecord(->[CONTACTS:1])
				End if 
				$_l_RecordID:=[CONTACTS:1]x_ID:33
				
				$_t_TableID:=String:C10(Table:C252(->[CONTACTS:1]); "0000")
				$_t_TableID:="1"+$_t_TableID+(String:C10($_l_RecordID; "000000000"))
				$_l_DeNormalised:=Num:C11($_t_TableID)
				QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
				QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRelationNUM:2=$_l_DeNormalised)
				If (Records in selection:C76([xDiaryRelations:137])=0)
					CREATE RECORD:C68([xDiaryRelations:137])
					[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
					[xDiaryRelations:137]xRecordID:4:=[CONTACTS:1]x_ID:33
					[xDiaryRelations:137]xTableNUM:3:=Table:C252(->[CONTACTS:1])
					[xDiaryRelations:137]XRelationNUM:2:=$_l_DeNormalised
					SAVE RECORD:C53([xDiaryRelations:137])
					
				End if 
				UNLOAD RECORD:C212([CONTACTS:1])
				
				
			End if 
			
		End if 
		
		If ([DIARY:12]Job_Code:19#"")
			QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=[DIARY:12]Job_Code:19)
			If (Records in selection:C76([JOBS:26])>0)
				If ([JOBS:26]x_ID:49=0)
					READ WRITE:C146([JOBS:26])
					LOAD RECORD:C52([JOBS:26])
					[JOBS:26]x_ID:49:=AA_GetNextID(->[JOBS:26]x_ID:49)
					DB_SaveRecord(->[JOBS:26])
				End if 
				$_l_RecordID:=[JOBS:26]x_ID:49
				
				$_t_TableID:=String:C10(Table:C252(->[JOBS:26]); "0000")
				$_t_TableID:="1"+$_t_TableID+(String:C10($_l_RecordID; "000000000"))
				$_l_DeNormalised:=Num:C11($_t_TableID)
				QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
				QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRelationNUM:2=$_l_DeNormalised)
				If (Records in selection:C76([xDiaryRelations:137])=0)
					CREATE RECORD:C68([xDiaryRelations:137])
					[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
					[xDiaryRelations:137]xRecordID:4:=[JOBS:26]x_ID:49
					[xDiaryRelations:137]xTableNUM:3:=Table:C252(->[JOBS:26])
					[xDiaryRelations:137]XRelationNUM:2:=$_l_DeNormalised
					SAVE RECORD:C53([JOBS:26])
					
				End if 
				UNLOAD RECORD:C212([JOBS:26])
				
				
			End if 
			
		End if 
		If ([DIARY:12]Order_Code:26#"")
			QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[DIARY:12]Order_Code:26)
			If (Records in selection:C76([ORDERS:24])>0)
				If ([JOBS:26]x_ID:49=0)
					READ WRITE:C146([ORDERS:24])
					LOAD RECORD:C52([ORDERS:24])
					[ORDERS:24]x_ID:58:=AA_GetNextID(->[ORDERS:24]x_ID:58)
					DB_SaveRecord(->[ORDERS:24])
				End if 
				$_l_RecordID:=[ORDERS:24]x_ID:58
				
				$_t_TableID:=String:C10(Table:C252(->[ORDERS:24]); "0000")
				$_t_TableID:="1"+$_t_TableID+(String:C10($_l_RecordID; "000000000"))
				$_l_DeNormalised:=Num:C11($_t_TableID)
				QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
				QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRelationNUM:2=$_l_DeNormalised)
				If (Records in selection:C76([xDiaryRelations:137])=0)
					CREATE RECORD:C68([xDiaryRelations:137])
					[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
					[xDiaryRelations:137]xRecordID:4:=[ORDERS:24]x_ID:58
					[xDiaryRelations:137]xTableNUM:3:=Table:C252(->[ORDERS:24])
					[xDiaryRelations:137]XRelationNUM:2:=$_l_DeNormalised
					SAVE RECORD:C53([ORDERS:24])
					
				End if 
				UNLOAD RECORD:C212([ORDERS:24])
				
				
			End if 
			
		End if 
		If ([DIARY:12]Product_Code:13#"")
			QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[DIARY:12]Product_Code:13)
			If (Records in selection:C76([PRODUCTS:9])>0)
				If ([JOBS:26]x_ID:49=0)
					READ WRITE:C146([PRODUCTS:9])
					LOAD RECORD:C52([PRODUCTS:9])
					[PRODUCTS:9]X_ID:43:=AA_GetNextID(->[PRODUCTS:9]X_ID:43)
					DB_SaveRecord(->[PRODUCTS:9])
				End if 
				$_l_RecordID:=[PRODUCTS:9]X_ID:43
				
				$_t_TableID:=String:C10(Table:C252(->[PRODUCTS:9]); "0000")
				$_t_TableID:="1"+$_t_TableID+(String:C10($_l_RecordID; "000000000"))
				$_l_DeNormalised:=Num:C11($_t_TableID)
				QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
				QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRelationNUM:2=$_l_DeNormalised)
				If (Records in selection:C76([xDiaryRelations:137])=0)
					CREATE RECORD:C68([xDiaryRelations:137])
					[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
					[xDiaryRelations:137]xRecordID:4:=[PRODUCTS:9]X_ID:43
					[xDiaryRelations:137]xTableNUM:3:=Table:C252(->[PRODUCTS:9])
					[xDiaryRelations:137]XRelationNUM:2:=$_l_DeNormalised
					SAVE RECORD:C53([PRODUCTS:9])
					
				End if 
				UNLOAD RECORD:C212([PRODUCTS:9])
				
				
			End if 
			
		End if 
		If ([DIARY:12]Stage_Code:21#"")
			QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Stage_Code:2=[DIARY:12]Stage_Code:21)
			If (Records in selection:C76([JOB_STAGES:47])>0)
				If ([JOB_STAGES:47]x_ID:54=0)
					READ WRITE:C146([JOB_STAGES:47])
					LOAD RECORD:C52([JOB_STAGES:47])
					[JOB_STAGES:47]x_ID:54:=AA_GetNextID(->[JOB_STAGES:47]x_ID:54)
					DB_SaveRecord(->[JOB_STAGES:47])
				End if 
				$_l_RecordID:=[JOB_STAGES:47]x_ID:54
				
				$_t_TableID:=String:C10(Table:C252(->[JOB_STAGES:47]); "0000")
				$_t_TableID:="1"+$_t_TableID+(String:C10($_l_RecordID; "000000000"))
				$_l_DeNormalised:=Num:C11($_t_TableID)
				QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
				QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRelationNUM:2=$_l_DeNormalised)
				If (Records in selection:C76([xDiaryRelations:137])=0)
					CREATE RECORD:C68([xDiaryRelations:137])
					[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
					[xDiaryRelations:137]xRecordID:4:=[JOB_STAGES:47]x_ID:54
					[xDiaryRelations:137]xTableNUM:3:=Table:C252(->[JOB_STAGES:47])
					[xDiaryRelations:137]XRelationNUM:2:=$_l_DeNormalised
					SAVE RECORD:C53([JOB_STAGES:47])
					
				End if 
				UNLOAD RECORD:C212([JOB_STAGES:47])
				
				
			End if 
			
		End if 
		
	End if 
	
End if 
ERR_MethodTrackerReturn("SD2_UpdateDiaryRelations"; $_t_oldMethodName)