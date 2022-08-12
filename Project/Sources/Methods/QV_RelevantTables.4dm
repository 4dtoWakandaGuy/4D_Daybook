//%attributes = {}
If (False:C215)
	//Project Method Name:      QV_RelevantTables
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 11:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(QV_al_RelevantTableFIELDIDs;0)
	//ARRAY LONGINT(QV_al_RelevantTableIDs;0)
	//ARRAY LONGINT(QV_al_RelevanttableRecordIDs;0)
	//ARRAY TEXT(QV_at_RelevantTableNames;0)
	C_BOOLEAN:C305($_bo_Resize)
	C_LONGINT:C283($_l_CurrentRow; $_l_TableNumber; QV_l_SelectedOwnerFieldID; QV_l_SelectedOwnerID; QV_l_SelectedOwnerTableID)
	C_POINTER:C301($1; $2; $3; $4; $5)
	C_TEXT:C284($_t_oldMethodName; QV_t_QualitiesOwnerName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QV_RelevantTables")

//we get put the tables into a list that  have qualities attached to them
$_l_TableNumber:=$2->
//update this method with the qualities relations as we add them
ARRAY TEXT:C222(QV_at_RelevantTableNames; Get last table number:C254)
ARRAY LONGINT:C221(QV_al_RelevantTableIDs; Get last table number:C254)
ARRAY LONGINT:C221(QV_al_RelevantTableFIELDIDs; Get last table number:C254)
ARRAY LONGINT:C221(QV_al_RelevanttableRecordIDs; Get last table number:C254)
$_l_CurrentRow:=0
$_bo_Resize:=True:C214

Case of 
	: ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
		READ ONLY:C145([ORDER_ITEMS:25])
		If ($1->>0)
			
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]x_ID:58=$1->)
			QV_t_QualitiesOwnerName:="ORDER: "+[ORDER_ITEMS:25]Order_Code:1+" Item: "+String:C10([ORDER_ITEMS:25]Item_Number:27)
			QV_l_SelectedOwnerFieldID:=Field:C253(->[ORDER_ITEMS:25]x_ID:58)
			$_l_CurrentRow:=$_l_CurrentRow+1
			QV_at_RelevantTableNames{$_l_CurrentRow}:="Order Item"
			QV_al_RelevantTableIDs{$_l_CurrentRow}:=Table:C252(->[ORDER_ITEMS:25])
			QV_al_RelevanttableRecordIDs{$_l_CurrentRow}:=[ORDER_ITEMS:25]x_ID:58
			QV_al_RelevantTableFIELDIDs{$_l_CurrentRow}:=Field:C253(->[ORDER_ITEMS:25]x_ID:58)
			READ ONLY:C145([ORDERS:24])
			QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
			$_l_CurrentRow:=$_l_CurrentRow+1
			QV_at_RelevantTableNames{$_l_CurrentRow}:="Order"
			QV_al_RelevantTableIDs{$_l_CurrentRow}:=Table:C252(->[ORDERS:24])
			QV_al_RelevanttableRecordIDs{$_l_CurrentRow}:=[ORDERS:24]x_ID:58
			QV_al_RelevantTableFIELDIDs{$_l_CurrentRow}:=Field:C253(->[ORDERS:24]x_ID:58)
			
			If ([ORDER_ITEMS:25]Product_Code:2#"")
				READ ONLY:C145([PRODUCTS:9])
				QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
				If (Records in selection:C76([PRODUCTS:9])>0)
					$_l_CurrentRow:=$_l_CurrentRow+1
					QV_at_RelevantTableNames{$_l_CurrentRow}:="Product"
					QV_al_RelevantTableIDs{$_l_CurrentRow}:=Table:C252(->[PRODUCTS:9])
					QV_al_RelevanttableRecordIDs{$_l_CurrentRow}:=[PRODUCTS:9]X_ID:43
					QV_al_RelevantTableFIELDIDs{$_l_CurrentRow}:=Field:C253(->[PRODUCTS:9]X_ID:43)
				End if 
			End if 
			If ([ORDERS:24]Contact_Code:2#"")
				READ ONLY:C145([CONTACTS:1])
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[ORDERS:24]Contact_Code:2)
				$_l_CurrentRow:=$_l_CurrentRow+1
				QV_at_RelevantTableNames{$_l_CurrentRow}:="Contact"
				QV_al_RelevantTableIDs{$_l_CurrentRow}:=Table:C252(->[CONTACTS:1])
				QV_al_RelevanttableRecordIDs{$_l_CurrentRow}:=[CONTACTS:1]x_ID:33
				QV_al_RelevantTableFIELDIDs{$_l_CurrentRow}:=Field:C253(->[CONTACTS:1]x_ID:33)
			End if 
			
			If ([ORDERS:24]Company_Code:1#"")
				READ ONLY:C145([COMPANIES:2])
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[ORDERS:24]Company_Code:1)
				If (Records in selection:C76([COMPANIES:2])>0)
					If ([COMPANIES:2]Private:37=False:C215)
						$_l_CurrentRow:=$_l_CurrentRow+1
						QV_at_RelevantTableNames{$_l_CurrentRow}:="Company"
						QV_al_RelevantTableIDs{$_l_CurrentRow}:=Table:C252(->[COMPANIES:2])
						QV_al_RelevanttableRecordIDs{$_l_CurrentRow}:=[COMPANIES:2]x_ID:63
						QV_al_RelevantTableFIELDIDs{$_l_CurrentRow}:=Field:C253(->[COMPANIES:2]x_ID:63)
					End if 
				End if 
			End if 
			
		Else 
			If ($1-><0)
				//we have a set
				$_l_CurrentRow:=$_l_CurrentRow+1
				QV_at_RelevantTableNames{$_l_CurrentRow}:="Selection"
				QV_t_QualitiesOwnerName:="Order items Selection"
				QV_l_SelectedOwnerFieldID:=Field:C253(->[ORDER_ITEMS:25]x_ID:58)
				QV_al_RelevantTableIDs{$_l_CurrentRow}:=Table:C252(->[ORDER_ITEMS:25])
				QV_al_RelevanttableRecordIDs{$_l_CurrentRow}:=$1->
				QV_al_RelevantTableFIELDIDs{$_l_CurrentRow}:=Field:C253(->[ORDER_ITEMS:25]x_ID:58)
				
				
			End if 
		End if 
		
	: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
		READ ONLY:C145([ORDERS:24])
		If ($1->>0)
			
			QUERY:C277([ORDERS:24]; [ORDERS:24]x_ID:58=$1->)
			QV_t_QualitiesOwnerName:="ORDER: "+[ORDERS:24]Order_Code:3
			QV_l_SelectedOwnerFieldID:=Field:C253(->[ORDERS:24]x_ID:58)
			$_l_CurrentRow:=$_l_CurrentRow+1
			QV_at_RelevantTableNames{$_l_CurrentRow}:="Order"
			QV_al_RelevantTableIDs{$_l_CurrentRow}:=Table:C252(->[ORDERS:24])
			QV_al_RelevanttableRecordIDs{$_l_CurrentRow}:=[ORDERS:24]x_ID:58
			QV_al_RelevantTableFIELDIDs{$_l_CurrentRow}:=Field:C253(->[ORDERS:24]x_ID:58)
			If ([ORDERS:24]Contact_Code:2#"")
				READ ONLY:C145([CONTACTS:1])
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[ORDERS:24]Contact_Code:2)
				$_l_CurrentRow:=$_l_CurrentRow+1
				QV_at_RelevantTableNames{$_l_CurrentRow}:="Contact"
				QV_al_RelevantTableIDs{$_l_CurrentRow}:=Table:C252(->[CONTACTS:1])
				QV_al_RelevanttableRecordIDs{$_l_CurrentRow}:=[CONTACTS:1]x_ID:33
				QV_al_RelevantTableFIELDIDs{$_l_CurrentRow}:=Field:C253(->[CONTACTS:1]x_ID:33)
			End if 
			
			If ([ORDERS:24]Company_Code:1#"")
				READ ONLY:C145([COMPANIES:2])
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[ORDERS:24]Company_Code:1)
				If (Records in selection:C76([COMPANIES:2])>0)
					If ([COMPANIES:2]Private:37=False:C215)
						$_l_CurrentRow:=$_l_CurrentRow+1
						QV_at_RelevantTableNames{$_l_CurrentRow}:="Company"
						QV_al_RelevantTableIDs{$_l_CurrentRow}:=Table:C252(->[COMPANIES:2])
						QV_al_RelevanttableRecordIDs{$_l_CurrentRow}:=[COMPANIES:2]x_ID:63
						QV_al_RelevantTableFIELDIDs{$_l_CurrentRow}:=Field:C253(->[COMPANIES:2]x_ID:63)
					End if 
				End if 
			End if 
			
		Else 
			If ($1-><0)
				//we have a set
				$_l_CurrentRow:=$_l_CurrentRow+1
				QV_at_RelevantTableNames{$_l_CurrentRow}:="Selection"
				QV_t_QualitiesOwnerName:="Orders_Selection"
				QV_l_SelectedOwnerFieldID:=Field:C253(->[ORDERS:24]x_ID:58)
				QV_al_RelevantTableIDs{$_l_CurrentRow}:=Table:C252(->[ORDERS:24])
				QV_al_RelevanttableRecordIDs{$_l_CurrentRow}:=$1->
				QV_al_RelevantTableFIELDIDs{$_l_CurrentRow}:=Field:C253(->[ORDERS:24]x_ID:58)
				
				
			End if 
		End if 
		
		
	: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
		READ ONLY:C145([CONTACTS:1])
		If ($1->>0)
			
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=$1->)
			QV_t_QualitiesOwnerName:=[CONTACTS:1]Contact_Name:31
			QV_l_SelectedOwnerFieldID:=Field:C253(->[CONTACTS:1]x_ID:33)
			$_l_CurrentRow:=$_l_CurrentRow+1
			QV_at_RelevantTableNames{$_l_CurrentRow}:="Contact"
			QV_al_RelevantTableIDs{$_l_CurrentRow}:=Table:C252(->[CONTACTS:1])
			QV_al_RelevanttableRecordIDs{$_l_CurrentRow}:=[CONTACTS:1]x_ID:33
			QV_al_RelevantTableFIELDIDs{$_l_CurrentRow}:=Field:C253(->[CONTACTS:1]x_ID:33)
			READ ONLY:C145([COMPANIES:2])
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
			If (Records in selection:C76([COMPANIES:2])>0)
				If ([COMPANIES:2]Private:37=False:C215)
					$_l_CurrentRow:=$_l_CurrentRow+1
					QV_at_RelevantTableNames{$_l_CurrentRow}:="Company"
					QV_al_RelevantTableIDs{$_l_CurrentRow}:=Table:C252(->[COMPANIES:2])
					QV_al_RelevanttableRecordIDs{$_l_CurrentRow}:=[COMPANIES:2]x_ID:63
					QV_al_RelevantTableFIELDIDs{$_l_CurrentRow}:=Field:C253(->[COMPANIES:2]x_ID:63)
				End if 
			End if 
			
		Else 
			If ($1-><0)
				//we have a set
				$_l_CurrentRow:=$_l_CurrentRow+1
				QV_at_RelevantTableNames{$_l_CurrentRow}:="Selection"
				QV_t_QualitiesOwnerName:="Contact Record Selection"
				QV_l_SelectedOwnerFieldID:=Field:C253(->[CONTACTS:1]x_ID:33)
				QV_al_RelevantTableIDs{$_l_CurrentRow}:=Table:C252(->[CONTACTS:1])
				QV_al_RelevanttableRecordIDs{$_l_CurrentRow}:=$1->
				QV_al_RelevantTableFIELDIDs{$_l_CurrentRow}:=Field:C253(->[CONTACTS:1]x_ID:33)
				
				
			End if 
		End if 
		
	: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
		READ ONLY:C145([COMPANIES:2])
		If ($1->>0)
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$1->)
			QV_t_QualitiesOwnerName:=[COMPANIES:2]Company_Name:2
			QV_l_SelectedOwnerFieldID:=Field:C253(->[COMPANIES:2]x_ID:63)
			$_l_CurrentRow:=$_l_CurrentRow+1
			QV_at_RelevantTableNames{$_l_CurrentRow}:="Company"
			QV_al_RelevantTableIDs{$_l_CurrentRow}:=Table:C252(->[COMPANIES:2])
			QV_al_RelevanttableRecordIDs{$_l_CurrentRow}:=[COMPANIES:2]x_ID:63
			QV_al_RelevantTableFIELDIDs{$_l_CurrentRow}:=Field:C253(->[COMPANIES:2]x_ID:63)
		Else 
			If ($1-><0)
				$_l_CurrentRow:=$_l_CurrentRow+1
				QV_at_RelevantTableNames{$_l_CurrentRow}:="Selection"
				QV_t_QualitiesOwnerName:="Company Record Selection"
				QV_l_SelectedOwnerFieldID:=Field:C253(->[COMPANIES:2]x_ID:63)
				QV_al_RelevantTableIDs{$_l_CurrentRow}:=Table:C252(->[COMPANIES:2])
				QV_al_RelevanttableRecordIDs{$_l_CurrentRow}:=$1->
				QV_al_RelevantTableFIELDIDs{$_l_CurrentRow}:=Field:C253(->[COMPANIES:2]x_ID:63)
			End if 
			
		End if 
		
	: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
		READ ONLY:C145([PRODUCTS:9])
		If ($1->>0)
			QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]X_ID:43=$1->)
			
			QV_l_SelectedOwnerFieldID:=Field:C253(->[PRODUCTS:9]X_ID:43)
			$_l_CurrentRow:=$_l_CurrentRow+1
			QV_at_RelevantTableNames{$_l_CurrentRow}:="Product"
			QV_al_RelevantTableIDs{$_l_CurrentRow}:=Table:C252(->[PRODUCTS:9])
			QV_al_RelevanttableRecordIDs{$_l_CurrentRow}:=[PRODUCTS:9]X_ID:43
			QV_al_RelevantTableFIELDIDs{$_l_CurrentRow}:=Field:C253(->[PRODUCTS:9]X_ID:43)
			QV_t_QualitiesOwnerName:=[PRODUCTS:9]Product_Name:2
			
		Else 
			If ($1-><0)
				$_l_CurrentRow:=$_l_CurrentRow+1
				QV_at_RelevantTableNames{$_l_CurrentRow}:="Selection"
				QV_t_QualitiesOwnerName:="Product Record Selection"
				QV_l_SelectedOwnerFieldID:=Field:C253(->[PRODUCTS:9]X_ID:43)
				QV_al_RelevantTableIDs{$_l_CurrentRow}:=Table:C252(->[PRODUCTS:9])
				QV_al_RelevanttableRecordIDs{$_l_CurrentRow}:=$1->
				QV_al_RelevantTableFIELDIDs{$_l_CurrentRow}:=Field:C253(->[PRODUCTS:9]X_ID:43)
			End if 
			
		End if 
		
	: ($_l_TableNumber=Table:C252(->[DIARY:12]))
		$_bo_Resize:=False:C215
		
		//there are currently no qualities relating to the diary
		//but i want to show relevant qualities so this is indirect handling
		READ ONLY:C145([DIARY:12])
		QUERY:C277([DIARY:12]; [DIARY:12]x_ID:50=$1->)
		If ([DIARY:12]Data_Source_Table:49>0)
			Case of 
				: ([DIARY:12]Data_Source_Table:49=Table:C252(->[CONTACTS:1]))
					READ ONLY:C145([CONTACTS:1])
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[DIARY:12]Contact_Code:2)
					
					QV_l_SelectedOwnerID:=[CONTACTS:1]x_ID:33
					QV_l_SelectedOwnerTableID:=Table:C252(->[CONTACTS:1])
					QV_RelevantTables(->QV_l_SelectedOwnerID; ->QV_l_SelectedOwnerTableID; ->QV_at_RelevantTableNames; ->QV_al_RelevantTableIDs; ->QV_al_RelevanttableRecordIDs)
					
				: ([DIARY:12]Data_Source_Table:49=Table:C252(->[COMPANIES:2]))
					READ ONLY:C145([COMPANIES:2])
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[DIARY:12]Company_Code:1)
					//MESSAGE("Setting QV_l_SelectedOwnerID from QV_Relevant to "+String([COMPANIES]x_ID))
					
					QV_l_SelectedOwnerID:=[COMPANIES:2]x_ID:63
					QV_l_SelectedOwnerTableID:=Table:C252(->[COMPANIES:2])
					QV_RelevantTables(->QV_l_SelectedOwnerID; ->QV_l_SelectedOwnerTableID; ->QV_at_RelevantTableNames; ->QV_al_RelevantTableIDs; ->QV_al_RelevanttableRecordIDs)
					
				: ([DIARY:12]Data_Source_Table:49=Table:C252(->[PRODUCTS:9]))  //)
					//change this when products get qualities!
					If ([DIARY:12]Company_Code:1#"")
						READ ONLY:C145([COMPANIES:2])
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[DIARY:12]Company_Code:1)
						QV_l_SelectedOwnerID:=[COMPANIES:2]x_ID:63
						QV_l_SelectedOwnerTableID:=Table:C252(->[COMPANIES:2])
						QV_RelevantTables(->QV_l_SelectedOwnerID; ->QV_l_SelectedOwnerTableID; ->QV_at_RelevantTableNames; ->QV_al_RelevantTableIDs; ->QV_al_RelevanttableRecordIDs)
						
					End if 
				: ([DIARY:12]Data_Source_Table:49=Table:C252(->[ORDERS:24]))  //)
					//change this when orders get qualities!
					If ([DIARY:12]Company_Code:1#"")
						READ ONLY:C145([COMPANIES:2])
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[DIARY:12]Company_Code:1)
						QV_l_SelectedOwnerID:=[COMPANIES:2]x_ID:63
						QV_l_SelectedOwnerTableID:=Table:C252(->[COMPANIES:2])
						QV_RelevantTables(->QV_l_SelectedOwnerID; ->QV_l_SelectedOwnerTableID; ->QV_at_RelevantTableNames; ->QV_al_RelevantTableIDs; ->QV_al_RelevanttableRecordIDs)
						
					End if 
				: ([DIARY:12]Data_Source_Table:49=Table:C252(->[JOBS:26]))  //)
					//change this when JOBS get qualities!
					If ([DIARY:12]Company_Code:1#"")
						READ ONLY:C145([COMPANIES:2])
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[DIARY:12]Company_Code:1)
						QV_l_SelectedOwnerID:=[COMPANIES:2]x_ID:63
						QV_l_SelectedOwnerTableID:=Table:C252(->[COMPANIES:2])
						QV_RelevantTables(->QV_l_SelectedOwnerID; ->QV_l_SelectedOwnerTableID; ->QV_at_RelevantTableNames; ->QV_al_RelevantTableIDs; ->QV_al_RelevanttableRecordIDs)
						
					End if 
				: ([DIARY:12]Data_Source_Table:49=Table:C252(->[JOBS:26]))  //)
					//change this when bookings get qualities!
					If ([DIARY:12]Company_Code:1#"")
						READ ONLY:C145([COMPANIES:2])
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[DIARY:12]Company_Code:1)
						QV_l_SelectedOwnerID:=[COMPANIES:2]x_ID:63
						QV_l_SelectedOwnerTableID:=Table:C252(->[COMPANIES:2])
						QV_RelevantTables(->QV_l_SelectedOwnerID; ->QV_l_SelectedOwnerTableID; ->QV_at_RelevantTableNames; ->QV_al_RelevantTableIDs; ->QV_al_RelevanttableRecordIDs)
						
					End if 
				: ([DIARY:12]Data_Source_Table:49=Table:C252(->[SERVICE_CALLS:20]))  //)
					//change this when JOBS get qualities!
					If ([DIARY:12]Company_Code:1#"")
						READ ONLY:C145([COMPANIES:2])
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[DIARY:12]Company_Code:1)
						QV_l_SelectedOwnerID:=[COMPANIES:2]x_ID:63
						QV_l_SelectedOwnerTableID:=Table:C252(->[COMPANIES:2])
						QV_RelevantTables(->QV_l_SelectedOwnerID; ->QV_l_SelectedOwnerTableID; ->QV_at_RelevantTableNames; ->QV_al_RelevantTableIDs; ->QV_al_RelevanttableRecordIDs)
						
					End if 
				: ([DIARY:12]Data_Source_Table:49=Table:C252(->[JOB_STAGES:47]))  //)
					//change this when JOB stages get qualities!
					If ([DIARY:12]Company_Code:1#"")
						READ ONLY:C145([COMPANIES:2])
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[DIARY:12]Company_Code:1)
						QV_l_SelectedOwnerID:=[COMPANIES:2]x_ID:63
						QV_l_SelectedOwnerTableID:=Table:C252(->[COMPANIES:2])
						QV_RelevantTables(->QV_l_SelectedOwnerID; ->QV_l_SelectedOwnerTableID; ->QV_at_RelevantTableNames; ->QV_al_RelevantTableIDs; ->QV_al_RelevanttableRecordIDs)
						
					End if 
					
					
			End case 
		Else 
			//we dont know the key relation
			Case of 
				: ([DIARY:12]Company_Code:1#"")
					READ ONLY:C145([COMPANIES:2])
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[DIARY:12]Company_Code:1)
					QV_l_SelectedOwnerID:=[COMPANIES:2]x_ID:63
					QV_l_SelectedOwnerTableID:=Table:C252(->[COMPANIES:2])
					QV_RelevantTables(->QV_l_SelectedOwnerID; ->QV_l_SelectedOwnerTableID; ->QV_at_RelevantTableNames; ->QV_al_RelevantTableIDs; ->QV_al_RelevanttableRecordIDs)
					
				: ([DIARY:12]Contact_Code:2#"")
					READ ONLY:C145([CONTACTS:1])
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[DIARY:12]Contact_Code:2)
					QV_l_SelectedOwnerID:=[CONTACTS:1]x_ID:33
					QV_l_SelectedOwnerTableID:=Table:C252(->[CONTACTS:1])
					QV_RelevantTables(->QV_l_SelectedOwnerID; ->QV_l_SelectedOwnerTableID; ->QV_at_RelevantTableNames; ->QV_al_RelevantTableIDs; ->QV_al_RelevanttableRecordIDs)
					
			End case 
			
		End if 
	Else 
		// hide this window
		
		
End case 
If ($_bo_Resize)
	ARRAY TEXT:C222(QV_at_RelevantTableNames; $_l_CurrentRow)
	ARRAY LONGINT:C221(QV_al_RelevantTableIDs; $_l_CurrentRow)
	ARRAY LONGINT:C221(QV_al_RelevanttableRecordIDs; $_l_CurrentRow)
	ARRAY LONGINT:C221(QV_al_RelevantTableFIELDIDs; $_l_CurrentRow)
End if 
ERR_MethodTrackerReturn("QV_RelevantTables"; $_t_oldMethodName)
