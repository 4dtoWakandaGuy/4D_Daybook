//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Headings Update
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/08/2009 12:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $Group; $Heading)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Headings Update")
If ((Records in table:C83([HEADINGS:84])=0) & (Records in table:C83([ACCOUNTS:32])>0))
	ALL RECORDS:C47([ACCOUNTS:32])
	ORDER BY:C49([ACCOUNTS:32]; [ACCOUNTS:32]Group_Heading:6; >; [ACCOUNTS:32]Report_Heading:1; >)
	While (Not:C34(End selection:C36([ACCOUNTS:32])))
		If ([ACCOUNTS:32]Group_Heading:6="")
			NEXT RECORD:C51([ACCOUNTS:32])
		Else 
			$Group:=FirstWord([ACCOUNTS:32]Group_Heading:6)
			CREATE RECORD:C68([HEADINGS:84])
			[HEADINGS:84]Heading_Code:1:="G"+$Group
			[HEADINGS:84]Heading_Name:2:=Substring:C12([ACCOUNTS:32]Group_Heading:6; 4; 32000)
			[HEADINGS:84]Heading_Level:3:=1
			DB_SaveRecord(->[HEADINGS:84])
			While ((Not:C34(End selection:C36([ACCOUNTS:32]))) & ([ACCOUNTS:32]Group_Heading:6=($Group+"@")))
				If ([ACCOUNTS:32]Report_Heading:1="")
					NEXT RECORD:C51([ACCOUNTS:32])
				Else 
					$Heading:=FirstWord([ACCOUNTS:32]Report_Heading:1)
					CREATE RECORD:C68([HEADINGS:84])
					[HEADINGS:84]Heading_Code:1:=$Heading
					[HEADINGS:84]Heading_Name:2:=Substring:C12([ACCOUNTS:32]Report_Heading:1; 4; 32000)
					[HEADINGS:84]Heading_Level:3:=1
					[HEADINGS:84]Group_Code:5:="G"+$Group
					DB_SaveRecord(->[HEADINGS:84])
					While ((Not:C34(End selection:C36([ACCOUNTS:32]))) & ([ACCOUNTS:32]Group_Heading:6=($Group+"@")) & ([ACCOUNTS:32]Report_Heading:1=($Heading+"@")))
						[ACCOUNTS:32]Group_Heading:6:="G"+$Group
						[ACCOUNTS:32]Report_Heading:1:=$Heading
						DB_SaveRecord(->[ACCOUNTS:32])
						NEXT RECORD:C51([ACCOUNTS:32])
					End while 
				End if 
			End while 
		End if 
	End while 
	UNLOAD RECORD:C212([HEADINGS:84])
	UNLOAD RECORD:C212([ACCOUNTS:32])
End if 
ERR_MethodTrackerReturn("Headings Update"; $_t_oldMethodName)