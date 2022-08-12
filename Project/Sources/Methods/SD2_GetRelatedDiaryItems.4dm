//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_GetRelatedDiaryItems
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/11/2010 21:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_DiaryIDS; 0)
	C_BOOLEAN:C305($_bo_IncludeDeleted; $_bo_IncludeDocs; $4; $5)
	C_LONGINT:C283($_l_ID; $1; $2; $7)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName; $3; $6)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_GetRelatedDiaryItems")

If (Count parameters:C259>=3)
	If (Count parameters:C259>=4)
		$_bo_IncludeDocs:=$4
	Else 
		$_bo_IncludeDocs:=False:C215
	End if 
	If (Count parameters:C259>=5)
		$_bo_IncludeDeleted:=$5
	Else 
		$_bo_IncludeDeleted:=False:C215
	End if 
	If (Count parameters:C259>=7)
		$_l_ID:=$7
	Else 
		$_l_ID:=0
	End if 
	If ($3#"") | ($_l_ID#0)
		$_ptr_Field:=Field:C253($1; $2)
		QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xTableNUM:3=$1; *)
		If (Type:C295($_ptr_Field->)=Is longint:K8:6)
			If ($3#"") | (Count parameters:C259<7)
				QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRecord_Code:5=$3)
			Else 
				QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xRecordID:4=$7)
			End if 
		Else 
			QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRecord_Code:5=$3)
		End if 
		SELECTION TO ARRAY:C260([xDiaryRelations:137]xDiaryID:1; $_al_DiaryIDS)
		QUERY WITH ARRAY:C644([DIARY:12]x_ID:50; $_al_DiaryIDS)
		CREATE SET:C116([DIARY:12]; "$T1")
		REDUCE SELECTION:C351([DIARY:12]; 0)
		Case of 
			: ($1=Table:C252(->[COMPANIES:2]))
				Case of 
					: ($2=Field:C253(->[COMPANIES:2]Company_Code:1))
						QUERY:C277([DIARY:12]; [DIARY:12]Company_Code:1=$3)
						
				End case 
			: ($1=Table:C252(->[ORDERS:24]))
				Case of 
					: ($2=Field:C253(->[ORDERS:24]Order_Code:3))
						QUERY:C277([DIARY:12]; [DIARY:12]Order_Code:26=$3)
						
				End case 
				
				
			: ($1=Table:C252(->[SERVICE_CALLS:20]))
				Case of 
					: ($2=Field:C253(->[SERVICE_CALLS:20]Call_Code:4))
						QUERY:C277([DIARY:12]; [DIARY:12]Call_Code:25=$3)
						
				End case 
			: ($1=Table:C252(->[CONTACTS:1]))
				Case of 
					: ($2=Field:C253(->[CONTACTS:1]Contact_Code:2))
						QUERY:C277([DIARY:12]; [DIARY:12]Contact_Code:2=$3)
						
				End case 
			: ($1=Table:C252(->[DOCUMENTS:7]))
				Case of 
					: ($2=Field:C253(->[DOCUMENTS:7]Document_Code:1))
						QUERY:C277([DIARY:12]; [DIARY:12]Document_Code:15=$3)
						
				End case 
				
			: ($1=Table:C252(->[JOBS:26]))
				Case of 
					: ($2=Field:C253(->[JOBS:26]Job_Code:1))
						QUERY:C277([DIARY:12]; [DIARY:12]Job_Code:19=$3)
						
				End case 
			: ($1=Table:C252(->[PRODUCTS:9]))
				Case of 
					: ($2=Field:C253(->[PRODUCTS:9]Product_Code:1))
						QUERY:C277([DIARY:12]; [DIARY:12]Product_Code:13=$3)
						
				End case 
			: ($1=Table:C252(->[JOB_STAGES:47]))
				Case of 
					: ($2=Field:C253(->[JOB_STAGES:47]))
						QUERY:C277([DIARY:12]; [DIARY:12]Stage_Code:21=$3)
						If (Count parameters:C259>=6)  // It should be@@@@@@
							QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Job_Code:19=$6)
						End if 
				End case 
		End case 
		CREATE SET:C116([DIARY:12]; "$T2")
		UNION:C120("$T2"; "$T1"; "$T1")
		CLEAR SET:C117("$T2")
		USE SET:C118("$T1")
		CLEAR SET:C117("$T1")
		If ($_bo_IncludeDocs=False:C215)
			QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Document_Code:15="")  //only ones with no document code
		Else 
			QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Document_Code:15#"")  //only ones witha document code
		End if 
		If ($_bo_IncludeDeleted=False:C215)
			QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Deleted:43=0)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("SD2_GetRelatedDiaryItems"; $_t_oldMethodName)
