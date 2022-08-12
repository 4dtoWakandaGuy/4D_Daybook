//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_OM_TimeZonePicker
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 13:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CAL_at_DAbbr;0)
	//ARRAY TEXT(CAL_at_DST;0)
	//ARRAY TEXT(CAL_at_LTR;0)
	//ARRAY TEXT(CAL_at_Rules;0)
	//ARRAY TEXT(CAL_at_SAbbr;0)
	//ARRAY TEXT(CAL_at_STD;0)
	//ARRAY TEXT(CAL_at_TiZN;0)
	C_BOOLEAN:C305($_bo_isDST)
	C_LONGINT:C283($_l_SelectedRow; $1; CAL_l_SetDST; RB_No; RB_Yes)
	C_TEXT:C284($_t_MethodName; $_t_Offset; $_t_oldMethodName; $_t_Rule; CAL_T_UserTimeZone)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_OM_TimeZonePicker")


$_l_SelectedRow:=$1

//========================    Method Actions    ==================================

If (CAL_l_SetDST=0)
	If (CAL_at_DST{$_l_SelectedRow}="None")
		RB_Yes:=0
		
	Else 
		$_t_Rule:=CAL_at_Rules{$_l_SelectedRow}
		Case of 
			: ($_t_Rule="[1]")
				$_bo_isDST:=Cal4D_IsDaylightTime_Rule_1(Current date:C33(*))
				
			: ($_t_Rule="[2]")
				$_bo_isDST:=Cal4D_IsDaylightTime_Rule_2(Current date:C33(*))
				
			: ($_t_Rule="[3]")
				
			: ($_t_Rule="[4]")
				$_bo_isDST:=Cal4D_IsDaylightTime_Rule_4(Current date:C33(*))
				
			: ($_t_Rule="[5]")
				$_bo_isDST:=Cal4D_IsDaylightTime_Rule_5(Current date:C33(*))
				
			: ($_t_Rule="[6]")
				$_bo_isDST:=Cal4D_IsDaylightTime_Rule_6(Current date:C33(*))
				
			: ($_t_Rule="[7]")
				
			: ($_t_Rule="[8]")
				$_bo_isDST:=Cal4D_IsDaylightTime_Rule_8(Current date:C33(*))
				
			: ($_t_Rule="[9]")
				$_bo_isDST:=Cal4D_IsDaylightTime_Rule_9(Current date:C33(*))
				
			Else 
				$_bo_isDST:=False:C215
		End case 
		
		RB_Yes:=Num:C11($_bo_isDST)
		
	End if 
	RB_No:=1-RB_Yes
End if 

CAL_T_UserTimeZone:=CAL_at_TiZN{$_l_SelectedRow}+":"+CAL_at_LTR{$_l_SelectedRow}+":"
If (RB_Yes=1)
	If (CAL_at_DST{$_l_SelectedRow}="None")
		$_l_SelectedRow:=Num:C11(CAL_at_STD{$_l_SelectedRow})+100
		If ($_l_SelectedRow#0)
			$_t_Offset:=Choose:C955($_l_SelectedRow<0; "-"; "+")+String:C10(Abs:C99($_l_SelectedRow); "0000")
		Else 
			$_t_Offset:=" 0000"
		End if 
		
	Else 
		CAL_T_UserTimeZone:=CAL_T_UserTimeZone+"Daylight:"+CAL_at_DAbbr{$_l_SelectedRow}+":"+CAL_at_DST{$_l_SelectedRow}
		
	End if 
	
Else 
	CAL_T_UserTimeZone:=CAL_T_UserTimeZone+"Standard:"+CAL_at_SAbbr{$_l_SelectedRow}+":"+CAL_at_STD{$_l_SelectedRow}
	
End if 

//========================    Clean up and Exit    =================================
ERR_MethodTrackerReturn("Cal4D_OM_TimeZonePicker"; $_t_oldMethodName)