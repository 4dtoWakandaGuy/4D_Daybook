
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
	C_DATE:C307(SD2_d_DoFromBase)
	C_LONGINT:C283(SD2_l_DiaryFromUpDown)
End if 
//Code Starts Here
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If ([DIARY:12]Date_Do_From:4=!00-00-00!)
			[DIARY:12]Date_Do_From:4:=Current date:C33(*)
		End if 
		If (SD2_d_DoFromBase=!00-00-00!)
			SD2_d_DoFromBase:=[DIARY:12]Date_Do_From:4
		End if 
		[DIARY:12]Date_Do_From:4:=[DIARY:12]Date_Do_From:4+SD2_l_DiaryFromUpDown
		
End case 
