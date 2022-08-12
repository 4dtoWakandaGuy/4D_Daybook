If (False:C215)
	//object Name: [EW_ExportProjects]Entry.EX2field1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(EW_at_ExportTableNames;0)
	C_REAL:C285($_l_CharacterPosition)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.EX2field1"; Form event code:C388)
Case of 
		// : ((Form event=On Data Change ) & ([EW_ExportSteps]FileName#""))
	: (Form event code:C388=On Data Change:K2:15)
		Case of 
			: (Length:C16(Self:C308->)<1)  //4/12/03
				ALERT:C41("The File Name must be specified.")
				Self:C308->:=Replace string:C233(EW_at_ExportTableNames{EW_at_ExportTableNames}; " "; "")+".txt"
			: (Position:C15(".txt"; [EW_ExportTables:120]FileName:5)>0)
				// okey dokey
			: (Position:C15("."; [EW_ExportTables:120]FileName:5)>0)
				$_l_CharacterPosition:=Position:C15("."; [EW_ExportTables:120]FileName:5)
				[EW_ExportTables:120]FileName:5:=Substring:C12([EW_ExportTables:120]FileName:5; 1; $_l_CharacterPosition-1)+".txt"
			: (Position:C15("."; [EW_ExportTables:120]FileName:5)<1)
				[EW_ExportTables:120]FileName:5:=Substring:C12([EW_ExportTables:120]FileName:5; 1; 16)+".txt"
		End case 
End case 
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].Entry.EX2field1"; $_t_oldMethodName)
