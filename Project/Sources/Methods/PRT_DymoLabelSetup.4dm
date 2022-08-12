//%attributes = {}
If (False:C215)
	//Project Method Name:      PRT_DymoLabelSetup
	//------------------ Method Notes ------------------
	//This method will let RR select a blank label template and set
	//1) the content to go on the label-this could be a Variable containing the content. or a Variable or a macro-essentially we will assign this content to the label
	//2) The label template to use
	//3 the 'tray' to print from-left or right or ask
	//optional settings
	//4 Default Number of copies-If not part of the setup this is treated as one-by having a default a 2 label print can be set
	//5) variable field or macro containing the number of copies to print or "Ask" this allows the default for the setup to overridden
	//6)Font-note to pass this and no 4 or 5 pass 0 in 4 and "" in 5.  This is a font name
	//7) font size
	//8) style-bold-italic-undeline
	//)9 inlude counter
	//10) counter var(no var just 1 2 etc)
	//11 counter settings. aftertest formatwidth. leadingzeros startvalue(var) step value(var) before text
	//12 include date/time
	//13) date time settings-include time. After text, user24hr, dateformat, before text
	//14) Frame Lines. Under-over-around
	//15) frame properties width color
	//6) Image(logo) to go on the label
	//7) image position left top right bottom
	//
	
	
	
	
	//------------------ Revision Control ----------------
	//Date Created: 25/05/2012 15:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PRT_DymoLabelSetup")
ERR_MethodTrackerReturn("PRT_DymoLabelSetup"; $_t_oldMethodName)