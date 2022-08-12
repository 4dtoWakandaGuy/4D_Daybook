//%attributes = {}
If (False:C215)
	//Project Method Name:      INF_SetQuality
	//------------------ Method Notes ------------------
	//INF_SetQuality
	//save a row in the Qualities for a Company, Contact, Product or Order
	//IF it doesn't already exist
	//Otherwise update
	//Also Add to the Qualities List if needed
	
	//$0 = Boolean, Success or Failure
	//$1 = table pointer
	//$2 = X_ID - if zero assumes that the row is loaded and gets it from the field
	//$3 = QualityGroupID-if zero looks up the Group
	//$4 = Quality Group
	//$5 = QualityID-if zero looks up the Group
	//$6 = Quality Subgroup
	//$7 (optional) = Description - Text
	//$8 (optional) = Quality_Level - Real
	//$9 (optional) = Year - Longint
	//$10 (optional) = Quality_Date - Date
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Result; $0)
	C_DATE:C307($10)
	C_LONGINT:C283($_l_CountParameters; $_l_FieldNumber; $_l_FieldValue; $_l_GroupID; $_l_ListID; $_l_QualityID; $_l_TableNumber; $2; $3; $5; $9)
	C_POINTER:C301($_ptr_Table; $1)
	C_REAL:C285($8)
	C_TEXT:C284($_t_oldMethodName; $_t_QualityGroup; $_t_QualitySubgroup; $4; $6; $7)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INF_SetQuality")



$_l_CountParameters:=Count parameters:C259
$_bo_Result:=False:C215

If ($_l_CountParameters>5)
	
	$_ptr_Table:=$1
	$_l_TableNumber:=Table:C252($_ptr_Table)
	
	$_l_FieldValue:=$2
	
	If ($_l_TableNumber>0)
		
		READ WRITE:C146([INFORMATION:55])
		READ WRITE:C146([LIST_ITEMS:95])
		
		Case of 
			: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
				$_l_FieldNumber:=Field:C253(->[CONTACTS:1]x_ID:33)
				If ($_l_FieldValue<1)
					$_l_FieldValue:=[CONTACTS:1]x_ID:33  // Get the value from the current record
				End if 
				
			: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
				$_l_FieldNumber:=Field:C253(->[COMPANIES:2]x_ID:63)
				If ($_l_FieldValue<1)
					$_l_FieldValue:=[COMPANIES:2]x_ID:63
				End if 
				
			: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
				$_l_FieldNumber:=Field:C253(->[PRODUCTS:9]X_ID:43)
				If ($_l_FieldValue<1)
					$_l_FieldValue:=[PRODUCTS:9]X_ID:43
				End if 
				
			: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
				$_l_FieldNumber:=Field:C253(->[ORDERS:24]x_ID:58)
				If ($_l_FieldValue<1)
					$_l_FieldValue:=[ORDERS:24]x_ID:58
				End if 
				
		End case 
	End if 
	
	If (($_l_FieldValue>0) & ($_l_FieldNumber>0))
		
		$_l_GroupID:=$3
		$_t_QualityGroup:=Substring:C12($4; 1; 55)
		$_l_ListID:=0
		
		If ($_l_GroupID>0)  //if you've specified the QualityGroupID (unlikely)
			QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=$_l_GroupID)
			$_t_QualityGroup:=Substring:C12([LIST_ITEMS:95]List_Entry:2; 1; 55)
		Else   //look it up
			If ($_t_QualityGroup#"")
				If ($_l_ListID=0)
					QUERY:C277([x_ListUsage:112]; [x_ListUsage:112]x_TableID:3=Table:C252(->[INFORMATION:55]))
					$_l_ListID:=[x_ListUsage:112]x_ListID:2
				End if 
				QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]List_Entry:2=$_t_QualityGroup; *)
				QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]X_ListID:4=$_l_ListID)
				If (Records in selection:C76([LIST_ITEMS:95])=0)
					CREATE RECORD:C68([LIST_ITEMS:95])
					[LIST_ITEMS:95]X_ListID:4:=$_l_ListID
					QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$_l_ListID)
					[LIST_ITEMS:95]List_Name:1:=[X_LISTS:111]x_ListName:2
					[LIST_ITEMS:95]List_Entry:2:=$_t_QualityGroup
					DB_SaveRecord(->[LIST_ITEMS:95])
					$_l_ListID:=0
				Else 
					//$sublist:=0
					AA_GetListItemProperty("SUBLIST"; ->$_l_ListID)
					
				End if 
				$_l_GroupID:=[LIST_ITEMS:95]X_ID:3
				
			End if 
		End if 
		
		$_l_QualityID:=$5
		$_t_QualitySubgroup:=Substring:C12($6; 1; 55)
		
		If ($_l_QualityID>0)  //if you've specified the QualityID (unlikely)
			QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=$_l_QualityID)
			$_t_QualitySubgroup:=Substring:C12([LIST_ITEMS:95]List_Entry:2; 1; 55)
		Else   //look it up
			If (($_t_QualitySubgroup#"") & ($_l_GroupID>0) & ($_l_ListID>0))  //cannot create child if the parent list's just been created because no List has been established
				QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]List_Entry:2=$_t_QualitySubgroup; *)
				QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]X_ListID:4=$_l_ListID)
				If (Records in selection:C76([LIST_ITEMS:95])=0)
					CREATE RECORD:C68([LIST_ITEMS:95])
					[LIST_ITEMS:95]X_ListID:4:=$_l_GroupID
					QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$_l_ListID)
					[LIST_ITEMS:95]List_Name:1:=[X_LISTS:111]x_ListName:2
					[LIST_ITEMS:95]List_Entry:2:=$_t_QualitySubgroup
					DB_SaveRecord(->[LIST_ITEMS:95])
				End if 
				$_l_QualityID:=[LIST_ITEMS:95]X_ID:3
				
			End if 
		End if 
		
		If ($_l_QualityID>0)  //must have at least the Quality
			
			//now look for the info row itself
			
			QUERY:C277([INFORMATION:55]; [INFORMATION:55]RelatedTableNumber:11=$_l_TableNumber; *)
			QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]RelatedTableFieldNum:12=$_l_FieldNumber; *)
			QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]RelateTableRecordNumber:13=$_l_FieldValue; *)
			If ($_l_GroupID>0)
				QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]QualityGroupID:15=$_l_GroupID; *)
			End if 
			QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]QualityID:14=$_l_QualityID)
			
			If (Records in selection:C76([INFORMATION:55])=0)
				CREATE RECORD:C68([INFORMATION:55])
				[INFORMATION:55]QualityRecordID:16:=AA_GetNextIDinMethod(->[INFORMATION:55]QualityRecordID:16)
				[INFORMATION:55]RelatedTableNumber:11:=$_l_TableNumber
				[INFORMATION:55]RelatedTableFieldNum:12:=$_l_FieldNumber
				[INFORMATION:55]RelateTableRecordNumber:13:=$_l_FieldValue
				[INFORMATION:55]QualityGroupID:15:=$_l_GroupID
				[INFORMATION:55]QualityID:14:=$_l_QualityID
				Qual_Code
			End if 
			
			[INFORMATION:55]Group:2:=$_t_QualityGroup
			[INFORMATION:55]SubGroup:6:=$_t_QualitySubgroup
			
			If ([INFORMATION:55]Deleted:10#0)  //undelete a deleted one if saved again
				[INFORMATION:55]Deleted:10:=0
			End if 
			
			If ($_l_CountParameters>6)
				[INFORMATION:55]Description:3:=$7
			End if 
			
			If ($_l_CountParameters>7)
				[INFORMATION:55]Information_Level:4:=$8
			End if 
			
			If ($_l_CountParameters>8)
				[INFORMATION:55]Year:5:=$9
			End if 
			
			If ($_l_CountParameters>9)
				[INFORMATION:55]Information_Date:8:=$10
			Else 
				If ([INFORMATION:55]Information_Date:8=!00-00-00!)
					[INFORMATION:55]Information_Date:8:=Current date:C33
				End if 
			End if 
			
			DB_SaveRecord(->[INFORMATION:55])
			
			READ ONLY:C145([INFORMATION:55])
			UNLOAD RECORD:C212([INFORMATION:55])
			READ ONLY:C145([LIST_ITEMS:95])
			UNLOAD RECORD:C212([LIST_ITEMS:95])
			
			$_bo_Result:=True:C214
			
		End if 
		
	End if 
	
End if 

$0:=$_bo_Result
ERR_MethodTrackerReturn("INF_SetQuality"; $_t_oldMethodName)