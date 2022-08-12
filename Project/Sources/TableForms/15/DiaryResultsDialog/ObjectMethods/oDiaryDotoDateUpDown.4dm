
If (False:C215)
	//Project Method Name:      SD2_l_DiaryFromUpDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  14/07/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	C_DATE:C307(SD2_d_DotoBase)
	C_LONGINT:C283(SD2_l_DiarytoUpDown)
End if 
//Code Starts Here
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If ([DIARY:12]Date_Do_To:33=!00-00-00!)
			[DIARY:12]Date_Do_To:33:=Current date:C33(*)
		End if 
		If (SD2_d_DotoBase=!00-00-00!)
			SD2_d_DotoBase:=[DIARY:12]Date_Do_To:33
		End if 
		[DIARY:12]Date_Do_To:33:=[DIARY:12]Date_Do_To:33+SD2_l_DiarytoUpDown
		
End case 
