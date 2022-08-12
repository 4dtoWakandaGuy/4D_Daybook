//%attributes = {}
If (False:C215)
	//Project Method Name:      Letter_Print
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 17:57
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($2)
	//C_UNKNOWN(k12003)
	//C_UNKNOWN(k12010)
	//C_UNKNOWN(vText)
	//C_UNKNOWN(Write_2)
	C_LONGINT:C283($2; WRITE_2; First)
	C_TEXT:C284($_t_oldMethodName; vText; $_t_oldMethodName; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letter_Print")
//Letter_Print - see also Letter_Email



Letter_Print2
Case of 
	: (Documents_4DWriteAccessType(False:C215)="W@")
		If (OK=1)
			vText:=""
			Write_2:=WR New offscreen area:P12000:47  //wr new offscreen area
			WR PICTURE TO AREA:P12000:141(Write_2; [DOCUMENTS:7]Write_:5)
			WR SET DOC PROPERTY:P12000:109(Write_2; wr view references:K12003:17; 0)
			Letter_Replace
			If (First=1)
				WR EXECUTE COMMAND:P12000:113(Write_2; 106)
				
				// WR O DO COMMAND (Write;106)
				If (OK=1)
					If (Count parameters:C259>=2)
						If ($2>0)  //email not appropriate to do this
						Else 
							WR EXECUTE COMMAND:P12000:113(Write_2; 108)
							//WR O DO COMMAND (Write;111)
						End if 
					Else 
						WR EXECUTE COMMAND:P12000:113(Write_2; 108)
						// WR O DO COMMAND (Write;111)
					End if 
					If (Count parameters:C259>=3)
						If ($2=1)
							Case of 
								: (Is macOS:C1572)
									WR SET PRINT OPTION:P12000:173(Write_2; wr destination option:K12010:9; 3; 0; $3)
									
									
									//SET PRINT OPTION(Destination option ;3;$3)
								: (Is Windows:C1573)
									Doc_InitPrintPreferences
									
							End case 
						End if 
					End if 
					WR PRINT:P12000:4(Write_2)
				End if 
				First:=0
			Else 
				If (Count parameters:C259>=3)
					If ($2=1)
						Case of 
							: (Is macOS:C1572)
								WR SET PRINT OPTION:P12000:173(Write_2; wr destination option:K12010:9; 3; 0; $3)
								
								
								//SET PRINT OPTION(Destination option ;3;$3)
							: (Is Windows:C1573)
								Doc_InitPrintPreferences
								
						End case 
					End if 
				End if 
				
				WR PRINT:P12000:4(Write_2)
			End if 
			WR DELETE OFFSCREEN AREA:P12000:38(Write_2)
		End if 
		// : (◊Write="SW")  ` SuperWrite OUT 24/04/02 pb
		//   $p2:=SW New Area
		//  If ($p2>0)
		//    $p:=SW Set Area ($p2;[DOCUMENTS]Write_)
		//   If ($p=0)
		//    $p:=SW Merge Values ($p2;3)
		//    If ($p=0)
		//       $p:=SW Get Area ($p2;$pict)
		//      If ($p=0)
		//       If (First=1)
		//         $p:=SW Print ($pict;3)
		//         First:=0
		//       Else
		//          $p:=SW Print ($pict;0)  `this second parameter doesn't work
		//        End if
		//      End if
		//    End if
		//   End if
		//   $p:=SW Delete Area ($p2)
		// End if
	Else 
		ALERT:C41("NOT AVAILABLE")
		
End case 
ERR_MethodTrackerReturn("Letter_Print"; $_t_oldMethodName)
