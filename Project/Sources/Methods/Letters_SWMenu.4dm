//%attributes = {}
If (False:C215)
	//Project Method Name:      Letters_SWMenu
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/03/2010 13:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(vMod3)
	C_LONGINT:C283($_l_menuItemNumber; $_l_menuNumber; $_l_menuNumberH; $_l_menuNumberV; $_l_r)
	C_TEXT:C284($_t_MenuName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters_SWMenu")
//Letters_SWMenu - SuperWrite
// apprantly also used by 4DWrite pb

If (Menu selected:C152#0)
	$_l_menuNumber:=Menu selected:C152\65536
	$_l_menuItemNumber:=Menu selected:C152%65536
	$_t_MenuName:=Get menu title:C430($_l_menuNumber\65536)
	//If ($_t_MenuName="View")
	Case of 
			
		: ($_t_MenuName="File")  //File
			Case of 
				: ($_l_menuItemNumber<10)
					//         $_l_r:=SW Do Command(Write;100+
					//$_l_menuItemNumber-Num($_l_menuItemNumber>3)-Num($_l_menuItemNumber>6)-Num($_l_menuItemNumber>9);0)
					//  ALERT("SuperWrite error no. SW1234. Please inform the programmer!")  ` 24/04/0
					Gen_Alert("SuperWrite error no. SW1234. Please inform the programmer!")
				: ($_l_menuItemNumber=11)
					Letters_SWInfo
				: ($_l_menuItemNumber=13)
					//         $_l_r:=SW Do Command(Write;108;0)
					//   ALERT("SuperWrite error no. SW1235. Please inform the programmer!")  ` 24/04/
					Gen_Alert("SuperWrite error no. SW1235. Please inform the programmer!")
				: ($_l_menuItemNumber=14)
					//         $_l_r:=SW Do Command(Write;110;0)
					//        ALERT("SuperWrite error no. SW1236. Please inform the programmer!")  ` 2
					Gen_Alert("SuperWrite error no. SW1236. Please inform the programmer!")
				: ($_l_menuItemNumber=15)
					//         $_l_r:=SW Do Command(Write;109;0)
					//         ALERT("SuperWrite error no. SW1237. Please inform the programmer!")  `
					Gen_Alert("SuperWrite error no. SW1237. Please inform the programmer!")
				: ($_l_menuItemNumber=16)
					Letters_SWMerSp
				: ($_l_menuItemNumber=18)
					//          $_l_r:=SW Do Command(Write;111;0)
					//          ALERT("SuperWrite error no. SW1238. Please inform the programmer!")  `
					Gen_Alert("SuperWrite error no. SW1238. Please inform the programmer!")
					If ($_l_r=0)
						//           $_l_r:=SW Options(Write;0;0;0;1;1;1;0)
						//   ALERT("SuperWrite error no. SW1239. Please inform the programmer!")  ` 24/04/
						Gen_Alert("SuperWrite error no. SW1239. Please inform the programmer!")
						If (vMod3)
							DB_MenuAction("File"; "Entry Defaults"; 4; "")
							//  SET MENU ITEM MARK(2049;18;" ")
							vMod3:=False:C215
						Else 
							DB_MenuAction("File"; "Entry Defaults"; 4; "")
							//  SET MENU ITEM MARK(2049;18;"18")
							vMod3:=True:C214
						End if 
					End if 
			End case 
			
		: ($_t_MenuName="View")  //View
			
			
		: ($_t_MenuName="Find")  //Search
			//     $_l_r:=SW Do Command(Write;400+$_l_menuItemNumber-Num($_l_menuItemNumber>5);0)
			// ALERT("SuperWrite error no. SW1248. Please inform the programmer!")  ` 24/04/02
			Gen_Alert("SuperWrite error no. SW1248. Please inform the programmer!")
			
		: ($_l_menuNumber=2052)  //Format
			//      $_l_r:=SW Do Command(Write;600+$_l_menuItemNumber-Num($_l_menuItemNumber>3)-Num($_l_menuItemNumber>5);0)
			//   ALERT("SuperWrite error no. SW1249. Please inform the programmer!")  ` 24/04/
			Gen_Alert("SuperWrite error no. SW1249. Please inform the programmer!")
			
		: ($_l_menuNumber=2053)  //Merge/Database
			//  ALERT("SuperWrite error no. SW1250. Please inform the programmer!")  ` 24/04/0
			Gen_Alert("SuperWrite error no. SW1250. Please inform the programmer!")
			//    Case of
			//       : ($_l_menuItemNumber=1)
			//        $_l_r:=SW Insert Var(Write;"Letter_Date";"vLetterDate";"")
			//      : ($_l_menuItemNumber=2)
			//        $_l_r:=SW Insert Var(Write;"Our Ref";"vOurRef";"")
			//      : ($_l_menuItemNumber=3)
			//        $_l_r:=SW Insert Var(Write;"Address";"vDetails";"")
			//      : ($_l_menuItemNumber=4)
			//         $_l_r:=SW Insert Var(Write;"Salutation";"vSalutation";"")
			//      : ($_l_menuItemNumber=5)
			//        $_l_r:=SW Insert Var(Write;"From";"vFrom";"")
			//      : ($_l_menuItemNumber=7)
			//        Gen_AskField
			//        If (OK=1)
			//          $_l_r:=SW Insert Field(Write;◊FieldL{◊FieldL};◊Files;◊FieldL;vConfirm)
			//        End if
			//      : ($_l_menuItemNumber=8)
			//        $_l_r:=SW Do Command(Write;702;0)
			//      : ($_l_menuItemNumber=10)
			//         Letters_GPDi
			// DEFAULT TABLE([DOCUMENTS])
			//         CREATE SET([DOCUMENTS];"Master")
			//     End case
			
	End case 
End if 
ERR_MethodTrackerReturn("Letters_SWMenu"; $_t_oldMethodName)