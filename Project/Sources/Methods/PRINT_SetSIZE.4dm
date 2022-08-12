//%attributes = {}
If (False:C215)
	//Project Method Name:      PRINT_SetSIZE
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/01/2010 17:51
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_PageSettings; $4; SR_bo_PageSetupDisplayed; SR_bo_PageSetupFound)
	C_LONGINT:C283($0)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; $_t_Orientation; $_t_PrintFormName; $_t_Size; $1; $2; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PRINT_SetSIZE")
//pass this method 2 or 3 parameters
$0:=1
//NG January 2007 This method is modified so that it retuurns 1 as in OK=1 by default
//if the option key is held down then this will open the print settings dialogue. If the users presses cancel on that dialogue they
//would expect to supress printing-up till now it does not. In some cases the print settings is called after a call to PRINT_SetSiZE
//in which case if the PRINT_SetSIZE was called with the option(alt) key held then it should not display the settings again(the settings are currently coming up twice which looks wierd to the user
//if the OK button is pressed on the print settings then this method will return 0 if they press CANCEL then this method will return minus 1.
//So after this method is pressed if the returned value is 0 or 1 OK can be set to 1. If the print settings is called after then that can be skipped if the value returned by this method is 0
//if this method returns -1 then stop printing.

//C_LONGINT($3)  `print % size-only works on a mac

If (Count parameters:C259>=2)
	$_t_Size:=$1
	If ($_t_Size="A4")
		//I have added this because some printers now print edge to edge
		//as a result forms set up for A4 print to near the edge so need to print A4 small
		//changing the position of objects on the form makes the form print wrong on non
		//edge to edge printers
		READ ONLY:C145([PERSONNEL:11])
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)
		If ([PERSONNEL:11]Print_PageSizePref:37="Small")
			$_t_Size:=$_t_Size+"S"
		End if 
	End if 
	
	$_t_Orientation:=$2
	If (Count parameters:C259>=3)
		If (Is macOS:C1572)
			$_t_PrintFormName:="M"+$_t_Size+$_t_Orientation  //+String($3)
		Else 
			$_t_PrintFormName:="W"+$_t_Size+$_t_Orientation
		End if 
	Else 
		If (Is macOS:C1572)
			$_t_PrintFormName:="M"+$_t_Size+$_t_Orientation
		Else 
			$_t_PrintFormName:="W"+$_t_Size+$_t_Orientation
		End if 
	End if 
	
	//we now have one of the following strings
	//MA4L
	//MA4P
	//MA4SL
	//MA4SP
	//WA4L
	//WA4P
	//WA4SL
	//WA4SP
	//etc
	_O_PAGE SETUP:C299([USER:15]; $_t_PrintFormName)
	If (Count parameters:C259>=4)
		//pass false if the page setup command is called after this
		//else pass true to display it
		$_bo_PageSettings:=$4
	Else 
		//if nothing is passed then check for option key held down(where no call is made to the page setup already)
		$_bo_PageSettings:=Gen_Option
		
	End if 
	If ($_bo_PageSettings)
		If (Count parameters:C259<3)
			PRT_GetPrinterPaperOptions($2)
		Else 
			PRT_GetPrinterPaperOptions($2; $3)
			
			
		End if 
		PRINT SETTINGS:C106
		$0:=OK-1
		SR_bo_PageSetupFound:=True:C214
		SR_bo_PageSetupDisplayed:=True:C214
	Else 
		
		
		
		
		If (Count parameters:C259<3)
			PRT_GetPrinterPaperOptions($2)
		Else 
			PRT_GetPrinterPaperOptions($2; $3)
			
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("PRINT_SetSIZE"; $_t_oldMethodName)
