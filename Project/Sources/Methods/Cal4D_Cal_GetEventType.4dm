//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_GetEventType
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 19:47`Method: Cal4D_Cal_GetEventType
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301(<>Cal_ptr_EventiCalUIDField; <>Cal_ptr_EventTable; <>Cal_ptr_EventTypeFldField)
	C_TEXT:C284($_t_DiaryViewID; $_t_MethodName; $_t_oldMethodName; $_t_SQL; $0; CAL_t_DiaryCode; Cal_t_SelectedEventUID; CAL_t_TempEventType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_GetEventType")

CAL_t_TempEventType:=""


If (Cal_t_SelectedEventUID#"")
	
	If (False:C215)
		$_t_SQL:="SELECT "+Field name:C257(<>Cal_ptr_EventTypeFldField)
		$_t_SQL:=$_t_SQL+" FROM "+Table name:C256(<>Cal_ptr_EventTable)
		$_t_SQL:=$_t_SQL+" WHERE "+Field name:C257(<>Cal_ptr_EventiCalUIDField)+" = :Cal_t_SelectedEventUID"
		$_t_SQL:=$_t_SQL+" INTO :CAL_t_TempEventType;"
		
		Begin SQL
			EXECUTE IMMEDIATE :$_t_SQL
		End SQL
	Else 
		QUERY:C277([SF_DiaryView:184]; [SF_DiaryView:184]DiaryView_UUID:1=Cal_t_SelectedEventUID)
		$_t_DiaryViewID:=[SF_DiaryView:184]DiaryView_DiaryID:3
		If ([DIARY:12]Diary_Code:3#$_t_DiaryViewID)
			
			CAL_t_DiaryCode:=$_t_DiaryViewID
			CAL_t_TempEventType:=""
			$_t_SQL:="SELECT "+"Action_Code"
			$_t_SQL:=$_t_SQL+" FROM "+"DIARY"
			$_t_SQL:=$_t_SQL+" WHERE "+"Diary_Code =:CAL_t_DiaryCode"
			$_t_SQL:=$_t_SQL+" INTO :CAL_t_TempEventType;"
			Begin SQL
				EXECUTE IMMEDIATE :$_t_SQL
			End SQL
		Else 
			CAL_t_TempEventType:=[DIARY:12]Action_Code:9
		End if 
		//QUERY([DIARY];[DIARY]Diary Code=$_t_DiaryViewID)
	End if 
	
	//CAL_t_TempEventType:=[DIARY]Action Code
	
End if 



$0:=CAL_t_TempEventType
ERR_MethodTrackerReturn("Cal4D_Cal_GetEventType"; $_t_oldMethodName)