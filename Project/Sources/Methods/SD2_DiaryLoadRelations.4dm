//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_DiaryLoadRelations
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 11:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Unload; $_bo_Unload2)
	C_LONGINT:C283($_l_DeNormalised)
	C_TEXT:C284($_t_DateString; $_t_JobName; $_t_oldMethodName; $_t_ProblemCode; $_t_StageName; $_t_StatusString)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_DiaryLoadRelations")
//NG this method takes a single Diary item and checks the relationships have been created



If ([DIARY:12]Call_Code:25#"")  //Service call
	QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
	QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xTableNUM:3=Table:C252(->[SERVICE_CALLS:20]); *)
	QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRecord_Code:5=[DIARY:12]Call_Code:25)
	If (Records in selection:C76([xDiaryRelations:137])=0)
		$_bo_Unload:=False:C215
		If ([SERVICE_CALLS:20]Call_Code:4=[DIARY:12]Call_Code:25)
			QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Call_Code:4=[DIARY:12]Call_Code:25)
			$_bo_Unload:=True:C214
		End if 
		If (Records in selection:C76([SERVICE_CALLS:20])>0)
			CREATE RECORD:C68([xDiaryRelations:137])
			[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
			[xDiaryRelations:137]xRecordID:4:=[SERVICE_CALLS:20]x_ID:27
			[xDiaryRelations:137]XRecord_Code:5:=[DIARY:12]Call_Code:25
			
			[xDiaryRelations:137]xTableNUM:3:=Table:C252(->[SERVICE_CALLS:20])
			$_l_DeNormalised:=Num:C11("1"+String:C10([xDiaryRelations:137]xTableNUM:3; "0000")+(String:C10([xDiaryRelations:137]xRecordID:4; "000000000")))
			[xDiaryRelations:137]XRelationNUM:2:=$_l_DeNormalised
			$_t_DateString:=" "+String:C10([SERVICE_CALLS:20]Call_Date:5; 4)
			$_t_ProblemCode:=[SERVICE_CALLS:20]Problem_Code:14
			If ($_t_ProblemCode#"")
				QUERY:C277([PROBLEMS:22]; [PROBLEMS:22]Problem_Code:1=$_t_ProblemCode)
				$_t_ProblemCode:=" "+[PROBLEMS:22]Problem_Name:2  //Note adding the spaces here
				UNLOAD RECORD:C212([PROBLEMS:22])
			End if 
			If ([SERVICE_CALLS:20]Resolved:9)
				$_t_StatusString:=" (Closed)"
			Else 
				$_t_StatusString:=" (Open)"
			End if 
			[xDiaryRelations:137]X_DisplayedName:6:="Call:"+$_t_ProblemCode+$_t_DateString+$_t_StatusString
			[xDiaryRelations:137]x_RelationshipName:7:="Service Call "
			DB_SaveRecord(->[xDiaryRelations:137])
			
		End if 
		If ($_bo_Unload)
			UNLOAD RECORD:C212([SERVICE_CALLS:20])
		End if 
	End if 
End if 

If ([DIARY:12]Company_Code:1#"")  //company
	QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
	QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xTableNUM:3=Table:C252(->[COMPANIES:2]); *)
	QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRecord_Code:5=[DIARY:12]Company_Code:1)
	If (Records in selection:C76([xDiaryRelations:137])=0)
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[DIARY:12]Company_Code:1)
		If (Records in selection:C76([COMPANIES:2])>0)
			CREATE RECORD:C68([xDiaryRelations:137])
			[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
			[xDiaryRelations:137]xRecordID:4:=[COMPANIES:2]x_ID:63
			[xDiaryRelations:137]XRecord_Code:5:=[DIARY:12]Company_Code:1
			
			[xDiaryRelations:137]xTableNUM:3:=Table:C252(->[COMPANIES:2])
			$_l_DeNormalised:=Num:C11("1"+String:C10([xDiaryRelations:137]xTableNUM:3; "0000")+(String:C10([xDiaryRelations:137]xRecordID:4; "000000000")))
			[xDiaryRelations:137]XRelationNUM:2:=$_l_DeNormalised
			[xDiaryRelations:137]X_DisplayedName:6:=[COMPANIES:2]Company_Name:2
			[xDiaryRelations:137]x_RelationshipName:7:="Company"
			DB_SaveRecord(->[xDiaryRelations:137])
			
		End if 
		
	End if 
End if 
If ([DIARY:12]Contact_Code:2#"")  //contacts
	QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
	QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xTableNUM:3=Table:C252(->[CONTACTS:1]); *)
	QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRecord_Code:5=[DIARY:12]Contact_Code:2)
	If (Records in selection:C76([xDiaryRelations:137])=0)
		QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[DIARY:12]Contact_Code:2)
		If (Records in selection:C76([CONTACTS:1])>0)
			CREATE RECORD:C68([xDiaryRelations:137])
			[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
			[xDiaryRelations:137]xRecordID:4:=[CONTACTS:1]x_ID:33
			[xDiaryRelations:137]XRecord_Code:5:=[DIARY:12]Contact_Code:2
			[xDiaryRelations:137]xTableNUM:3:=Table:C252(->[CONTACTS:1])
			$_l_DeNormalised:=Num:C11("1"+String:C10([xDiaryRelations:137]xTableNUM:3; "0000")+(String:C10([xDiaryRelations:137]xRecordID:4; "000000000")))
			[xDiaryRelations:137]XRelationNUM:2:=$_l_DeNormalised
			[xDiaryRelations:137]X_DisplayedName:6:=[CONTACTS:1]Contact_Name:31
			[xDiaryRelations:137]x_RelationshipName:7:="Contact"
			DB_SaveRecord(->[xDiaryRelations:137])
			
		End if 
		
	End if 
End if 
If ([DIARY:12]Job_Code:19#"")  //JOBS
	QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
	QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xTableNUM:3=Table:C252(->[JOBS:26]); *)
	QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRecord_Code:5=[DIARY:12]Job_Code:19)
	If (Records in selection:C76([xDiaryRelations:137])=0)
		QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=[DIARY:12]Job_Code:19)
		If (Records in selection:C76([JOBS:26])>0)
			CREATE RECORD:C68([xDiaryRelations:137])
			[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
			[xDiaryRelations:137]xRecordID:4:=[JOBS:26]x_ID:49
			[xDiaryRelations:137]XRecord_Code:5:=[DIARY:12]Job_Code:19
			[xDiaryRelations:137]xTableNUM:3:=Table:C252(->[JOBS:26])
			$_l_DeNormalised:=Num:C11("1"+String:C10([xDiaryRelations:137]xTableNUM:3; "0000")+(String:C10([xDiaryRelations:137]xRecordID:4; "000000000")))
			[xDiaryRelations:137]XRelationNUM:2:=$_l_DeNormalised
			[xDiaryRelations:137]X_DisplayedName:6:=[JOBS:26]Job_Name:2
			[xDiaryRelations:137]x_RelationshipName:7:="Job"
			DB_SaveRecord(->[xDiaryRelations:137])
		End if 
		
	End if 
End if 
If ([DIARY:12]Order_Code:26#"")  //Orders
	QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
	QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xTableNUM:3=Table:C252(->[ORDERS:24]); *)
	QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRecord_Code:5=[DIARY:12]Order_Code:26)
	If (Records in selection:C76([xDiaryRelations:137])=0)
		QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[DIARY:12]Order_Code:26)
		If (Records in selection:C76([ORDERS:24])>0)
			CREATE RECORD:C68([xDiaryRelations:137])
			[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
			[xDiaryRelations:137]xRecordID:4:=[ORDERS:24]x_ID:58
			[xDiaryRelations:137]XRecord_Code:5:=[DIARY:12]Order_Code:26
			
			[xDiaryRelations:137]xTableNUM:3:=Table:C252(->[ORDERS:24])
			$_l_DeNormalised:=Num:C11("1"+String:C10([xDiaryRelations:137]xTableNUM:3; "0000")+(String:C10([xDiaryRelations:137]xRecordID:4; "000000000")))
			[xDiaryRelations:137]XRelationNUM:2:=$_l_DeNormalised
			[xDiaryRelations:137]X_DisplayedName:6:=""
			[xDiaryRelations:137]x_RelationshipName:7:="Order"
			DB_SaveRecord(->[xDiaryRelations:137])
		End if 
		
	End if 
End if 

If ([DIARY:12]Stage_Code:21#"")  //company
	QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
	QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xTableNUM:3=Table:C252(->[JOB_STAGES:47]); *)
	QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRecord_Code:5=[DIARY:12]Stage_Code:21)
	If (Records in selection:C76([xDiaryRelations:137])=0)
		$_bo_Unload:=False:C215
		$_bo_Unload2:=False:C215
		If ([JOB_STAGES:47]Job_Stage_code:52#[DIARY:12]Stage_Code:21)
			QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Stage_code:52=[DIARY:12]Stage_Code:21)
			$_bo_Unload:=True:C214
		End if 
		If (Records in selection:C76([JOB_STAGES:47])>0)
			CREATE RECORD:C68([xDiaryRelations:137])
			[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
			[xDiaryRelations:137]xRecordID:4:=[JOB_STAGES:47]x_ID:54
			[xDiaryRelations:137]XRecord_Code:5:=[JOB_STAGES:47]Job_Stage_code:52
			If ([JOBS:26]Job_Code:1#[JOB_STAGES:47]Job_Code:1)
				QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=[JOB_STAGES:47]Job_Code:1)
				$_bo_Unload2:=True:C214
			End if 
			[xDiaryRelations:137]xTableNUM:3:=Table:C252(->[JOB_STAGES:47])
			$_l_DeNormalised:=Num:C11("1"+String:C10([xDiaryRelations:137]xTableNUM:3; "0000")+(String:C10([xDiaryRelations:137]xRecordID:4; "000000000")))
			[xDiaryRelations:137]XRelationNUM:2:=$_l_DeNormalised
			$_t_JobName:=[JOBS:26]Job_Name:2
			QUERY:C277([STAGES:45]; [STAGES:45]Stage_Code:1=[JOB_STAGES:47]Stage_Code:2)
			UNLOAD RECORD:C212([STAGES:45])
			$_t_StageName:=[STAGES:45]Stage_Name:2
			[xDiaryRelations:137]X_DisplayedName:6:=$_t_JobName+" "+$_t_StageName
			[xDiaryRelations:137]x_RelationshipName:7:="Stage"
			DB_SaveRecord(->[xDiaryRelations:137])
		End if 
		If ($_bo_Unload)
			UNLOAD RECORD:C212([JOB_STAGES:47])
		End if 
		If ($_bo_Unload2)
			UNLOAD RECORD:C212([JOBS:26])
		End if 
	End if 
End if 
If ([DIARY:12]Product_Code:13#"")  //company
	QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
	QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xTableNUM:3=Table:C252(->[PRODUCTS:9]); *)
	QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRecord_Code:5=[DIARY:12]Product_Code:13)
	If (Records in selection:C76([xDiaryRelations:137])=0)
		QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[DIARY:12]Product_Code:13)
		If (Records in selection:C76([PRODUCTS:9])>0)
			CREATE RECORD:C68([xDiaryRelations:137])
			[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
			[xDiaryRelations:137]xRecordID:4:=[PRODUCTS:9]X_ID:43
			[xDiaryRelations:137]XRecord_Code:5:=[PRODUCTS:9]Product_Code:1
			[xDiaryRelations:137]xTableNUM:3:=Table:C252(->[PRODUCTS:9])
			$_l_DeNormalised:=Num:C11("1"+String:C10([xDiaryRelations:137]xTableNUM:3; "0000")+(String:C10([xDiaryRelations:137]xRecordID:4; "000000000")))
			[xDiaryRelations:137]XRelationNUM:2:=$_l_DeNormalised
			[xDiaryRelations:137]X_DisplayedName:6:=""
			[xDiaryRelations:137]x_RelationshipName:7:="Product"
			DB_SaveRecord(->[xDiaryRelations:137])
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("SD2_DiaryLoadRelations"; $_t_oldMethodName)