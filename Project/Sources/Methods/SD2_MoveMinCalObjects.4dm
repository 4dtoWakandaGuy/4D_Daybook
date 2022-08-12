//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_MoveMinCalObjects
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Continue)
	C_LONGINT:C283($_l_ButtonNum; $_l_DayIndex; $_l_ObjectBottom; $_l_ObjectHeight; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_ObJWidth; $_l_RowIndex; $_l_RowPosition; $1)
	C_LONGINT:C283($2; $3; $4)
	C_TEXT:C284($_t_objectNameSTR; $_t_oldMethodName; $_t_RowString; $_t_weekObjectName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_MoveMinCalObjects")

//This method sets the mini calener objects with in the border postions passed in $1,$2,$3,$4)
If (Count parameters:C259>=4)
	$_l_RowPosition:=$2+2
	
	OBJECT GET COORDINATES:C663(*; "oMiniCalHLPOp"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_ObJWidth:=$_l_ObjectRight-$_l_ObjectLeft
	$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
	OBJECT MOVE:C664(*; "oMiniCalHLPOp"; $_l_ObjectLeft; $_l_RowPosition; $_l_ObjectRight; $_l_RowPosition+$_l_ObjectHeight; *)
	//``
	OBJECT GET COORDINATES:C663(*; "SD_Pic_Today"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_ObJWidth:=$_l_ObjectRight-$_l_ObjectLeft
	OBJECT MOVE:C664(*; "SD_Pic_Today"; $_l_ObjectLeft; $_l_RowPosition; $_l_ObjectRight; $_l_RowPosition+$_l_ObjectHeight; *)
	//``
	OBJECT GET COORDINATES:C663(*; "oMiniCalPrevPeriod"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_ObJWidth:=$_l_ObjectRight-$_l_ObjectLeft
	OBJECT MOVE:C664(*; "oMiniCalPrevPeriod"; $_l_ObjectLeft; $_l_RowPosition; $_l_ObjectRight; $_l_RowPosition+$_l_ObjectHeight; *)
	
	OBJECT GET COORDINATES:C663(*; "oMiniCalSelPeriod"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_ObJWidth:=$_l_ObjectRight-$_l_ObjectLeft
	OBJECT MOVE:C664(*; "oMiniCalSelPeriod"; $_l_ObjectLeft; $_l_RowPosition; $_l_ObjectRight; $_l_RowPosition+$_l_ObjectHeight; *)
	
	OBJECT GET COORDINATES:C663(*; "oMiniCalNextPeriod"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_ObJWidth:=$_l_ObjectRight-$_l_ObjectLeft
	OBJECT MOVE:C664(*; "oMiniCalNextPeriod"; $_l_ObjectLeft; $_l_RowPosition; $_l_ObjectRight; $_l_RowPosition+$_l_ObjectHeight; *)
	//```````
	
	$_l_RowPosition:=$_l_RowPosition+$_l_ObjectHeight+2
	
	OBJECT GET COORDINATES:C663(*; "oMiniCalTextWeek"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_ObJWidth:=$_l_ObjectRight-$_l_ObjectLeft
	OBJECT MOVE:C664(*; "oMiniCalTextWeek"; $_l_ObjectLeft; $_l_RowPosition; $_l_ObjectRight; $_l_RowPosition+$_l_ObjectHeight; *)
	
	OBJECT GET COORDINATES:C663(*; "oMiniCalTextMon"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_ObJWidth:=$_l_ObjectRight-$_l_ObjectLeft
	OBJECT MOVE:C664(*; "oMiniCalTextMon"; $_l_ObjectLeft; $_l_RowPosition; $_l_ObjectRight; $_l_RowPosition+$_l_ObjectHeight; *)
	
	OBJECT GET COORDINATES:C663(*; "oMiniCalTextTue"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_ObJWidth:=$_l_ObjectRight-$_l_ObjectLeft
	OBJECT MOVE:C664(*; "oMiniCalTextTue"; $_l_ObjectLeft; $_l_RowPosition; $_l_ObjectRight; $_l_RowPosition+$_l_ObjectHeight; *)
	
	OBJECT GET COORDINATES:C663(*; "oMiniCalTextWen"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_ObJWidth:=$_l_ObjectRight-$_l_ObjectLeft
	OBJECT MOVE:C664(*; "oMiniCalTextWen"; $_l_ObjectLeft; $_l_RowPosition; $_l_ObjectRight; $_l_RowPosition+$_l_ObjectHeight; *)
	
	
	OBJECT GET COORDINATES:C663(*; "oMiniCalTextThur"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_ObJWidth:=$_l_ObjectRight-$_l_ObjectLeft
	OBJECT MOVE:C664(*; "oMiniCalTextThur"; $_l_ObjectLeft; $_l_RowPosition; $_l_ObjectRight; $_l_RowPosition+$_l_ObjectHeight; *)
	
	OBJECT GET COORDINATES:C663(*; "oMiniCalTextFri"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_ObJWidth:=$_l_ObjectRight-$_l_ObjectLeft
	OBJECT MOVE:C664(*; "oMiniCalTextFri"; $_l_ObjectLeft; $_l_RowPosition; $_l_ObjectRight; $_l_RowPosition+$_l_ObjectHeight; *)
	
	OBJECT GET COORDINATES:C663(*; "oMiniCalTextSat"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_ObJWidth:=$_l_ObjectRight-$_l_ObjectLeft
	OBJECT MOVE:C664(*; "oMiniCalTextSat"; $_l_ObjectLeft; $_l_RowPosition; $_l_ObjectRight; $_l_RowPosition+$_l_ObjectHeight; *)
	
	OBJECT GET COORDINATES:C663(*; "oMiniCalTextSun"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_ObJWidth:=$_l_ObjectRight-$_l_ObjectLeft
	$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
	OBJECT MOVE:C664(*; "oMiniCalTextSun"; $_l_ObjectLeft; $_l_RowPosition; $_l_ObjectRight; $_l_RowPosition+$_l_ObjectHeight; *)
	//````
	//This section to keep the code compact..these rows are nice and sequential
	$_l_ButtonNum:=0
	For ($_l_RowIndex; 1; 6)  //Five full rows
		$_l_RowPosition:=$_l_RowPosition+$_l_ObjectHeight+2
		$_t_RowString:=String:C10($_l_RowIndex)
		$_t_weekObjectName:="oMiniCalTextWeek"+$_t_RowString
		//```The label
		OBJECT GET COORDINATES:C663(*; $_t_weekObjectName; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_ObJWidth:=$_l_ObjectRight-$_l_ObjectLeft
		$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
		OBJECT MOVE:C664(*; $_t_weekObjectName; $_l_ObjectLeft; $_l_RowPosition; $_l_ObjectRight; $_l_RowPosition+$_l_ObjectHeight; *)
		//````
		//The var
		$_t_weekObjectName:="oMiniCalWeek"+$_t_RowString
		OBJECT GET COORDINATES:C663(*; $_t_weekObjectName; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_ObJWidth:=$_l_ObjectRight-$_l_ObjectLeft
		$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
		OBJECT MOVE:C664(*; $_t_weekObjectName; $_l_ObjectLeft; $_l_RowPosition; $_l_ObjectRight; $_l_RowPosition+$_l_ObjectHeight; *)
		
		For ($_l_DayIndex; 1; 7)  //7 cold per row
			$_bo_Continue:=True:C214
			If ($_l_RowIndex=6)
				If ($_l_DayIndex>2)
					$_bo_Continue:=False:C215
				End if 
			End if 
			If ($_bo_Continue)
				$_l_ButtonNum:=$_l_ButtonNum+1
				//`The button String
				$_t_objectNameSTR:=String:C10($_l_ButtonNum)
				$_t_weekObjectName:="oMiniCalTextDay"+$_t_objectNameSTR
				OBJECT GET COORDINATES:C663(*; $_t_weekObjectName; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				$_l_ObJWidth:=$_l_ObjectRight-$_l_ObjectLeft
				$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
				OBJECT MOVE:C664(*; $_t_weekObjectName; $_l_ObjectLeft; $_l_RowPosition; $_l_ObjectRight; $_l_RowPosition+$_l_ObjectHeight; *)
				//`the button
				$_t_objectNameSTR:=String:C10($_l_ButtonNum)
				$_t_weekObjectName:="oMiniCalDay"+$_t_objectNameSTR
				OBJECT GET COORDINATES:C663(*; $_t_weekObjectName; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				$_l_ObJWidth:=$_l_ObjectRight-$_l_ObjectLeft
				$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
				OBJECT MOVE:C664(*; $_t_weekObjectName; $_l_ObjectLeft; $_l_RowPosition; $_l_ObjectRight; $_l_RowPosition+$_l_ObjectHeight; *)
			End if 
		End for 
	End for 
	
End if 
ERR_MethodTrackerReturn("SD2_MoveMinCalObjects"; $_t_oldMethodName)
