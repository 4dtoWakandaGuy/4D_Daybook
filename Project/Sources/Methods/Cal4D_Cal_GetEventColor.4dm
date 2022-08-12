//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_GetEventColor
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 19:40`Method: Cal4D_Cal_GetEventColor
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ColourB; $_l_ColourG; $_l_ColourR; $0; CAL_l_TmpEventID)
	C_POINTER:C301(<>Cal_ptr_EventColorField; <>Cal_ptr_EventiCalUIDField; <>Cal_ptr_EventTable)
	C_TEXT:C284($_t_oldMethodName; $_t_SQL; Cal_t_SelectedEventUID; tDiaryCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_GetEventColor")

CAL_l_TmpEventID:=0

//========================    Method Actions    ==================================

If (Cal_t_SelectedEventUID#"")
	If (False:C215)
		$_t_SQL:="SELECT "+Field name:C257(<>Cal_ptr_EventColorField)
		$_t_SQL:=$_t_SQL+" FROM "+Table name:C256(<>Cal_ptr_EventTable)
		$_t_SQL:=$_t_SQL+" WHERE "+Field name:C257(<>Cal_ptr_EventiCalUIDField)+" = :Cal_t_SelectedEventUID"
		$_t_SQL:=$_t_SQL+" INTO :CAL_l_TmpEventID;"
		
		Begin SQL
			EXECUTE IMMEDIATE :$_t_SQL
		End SQL
	Else 
		//ON ERR CALL("")
		$_l_ColourR:=0
		$_l_ColourG:=0
		$_l_ColourB:=0
		QUERY:C277([SF_DiaryView:184]; [SF_DiaryView:184]DiaryView_UUID:1=Cal_t_SelectedEventUID)
		tDiaryCode:=[SF_DiaryView:184]DiaryView_DiaryID:3
		$_t_SQL:="SELECT "+"AGFillColourRed"+", "+"AGFillColourGreen"+", "
		$_t_SQL:=$_t_SQL+"AGFillColourBlue"
		$_t_SQL:=$_t_SQL+" FROM "+"DIARY"
		$_t_SQL:=$_t_SQL+" WHERE "+"Diary_Code"+" = :tDiaryCode"
		$_t_SQL:=$_t_SQL+" INTO "+":"+"$_l_ColourR, :$_l_ColourG, :$_l_ColourB"
		
		Begin SQL
			EXECUTE IMMEDIATE :$_t_SQL
		End SQL
		//QUERY([DIARY];[DIARY]Diary_Code=[SF_DiaryView]DiaryView_DiaryID)  `$DiaryCode)
		//$_l_ColourR:=[DIARY]AGFillColourRed
		//$_l_ColourG:=[DIARY]AGFillColourGreen
		//$_l_ColourB:=[DIARY]AGFillColourBlue
		CAL_l_TmpEventID:=($_l_ColourR << 16)+($_l_ColourG << 8)+$_l_ColourB
		//CAL_l_TmpEventID:=
	End if 
	
	
	
End if 

$0:=CAL_l_TmpEventID
ERR_MethodTrackerReturn("Cal4D_Cal_GetEventColor"; $_t_oldMethodName)