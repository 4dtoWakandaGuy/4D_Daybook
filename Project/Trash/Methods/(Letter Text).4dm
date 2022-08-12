//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Letter Text
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/08/2009 17:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Length; WRITE)
	C_TEXT:C284($_t_oldMethodName; $_t_Text; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letter Text")
//letter text as Now in Daybook
//FIGURES MARKED **** REQUIRE ADJUSTMENT ACCORDING TO FONT AND LETTER LAYOUT
//FOR EACH PAGE LENGTH, ALLOW 5 LINES SPARE FOR THE SIGNATURE & NAME



If (WIN_t_CurrentInputForm="Letters_In13W")
	[DOCUMENTS:7]Write_:5:=WR Area to picture:P12000:139(WRITE; 1; 1)
	
End if 
ERR_MethodTrackerReturn("Letter Text"; $_t_oldMethodName)