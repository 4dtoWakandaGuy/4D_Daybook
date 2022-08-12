//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_FuncSplit
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
	C_TEXT:C284($_t_Module; $_t_oldMethodName; IWS_t_URL)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_FuncSplit")
// IWS_FuncSplit
// obtain function and split down in order to call correct method



$_t_Module:=Substring:C12(IWS_t_URL; Position:C15("?"; IWS_t_URL)+1)  // copy desired part of URL
$_t_Module:=Substring:C12($_t_Module; 1; Position:C15("&"; $_t_Module)-1)  // isolate name of module

// okay, in the first version, i gonna leave out all modules except for the
// smpt example. the others are also available for the public soon.
Case of 
	: ($_t_Module="smtp")  // send email via smtp
		//    IWS_ModuleSMTP   ` go to smtp module
	: ($_t_Module="pop3")  // receive email via pop3
	: ($_t_Module="search")  // take advantage of search engine
	: ($_t_Module="cart")  // use the shopping cart
End case 
ERR_MethodTrackerReturn("IWS_FuncSplit"; $_t_oldMethodName)