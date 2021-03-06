
Func DropOnEdges($troop, $nbSides, $number, $slotsPerEdge = 0)
	If $nbSides = 0 Or $number = 1 Then
		OldDropTroop($troop, $Edges[0], $number);
		Return
	EndIf
	If $nbSides < 1 Then Return
	Local $nbTroopsLeft = $number

	If $nbSides = 5 Then
		If $slotsPerEdge = 2 Then
			For $i = 0 To $nbSides - 4 ;Four Finger Deployment Giants
				Local $nbTroopsPerEdge = Round($nbTroopsLeft / (($nbSides-1) - $i * 2))
				DropOnEdge($troop, $Edges[$i], $nbTroopsPerEdge, $slotsPerEdge, $Edges[$i + 2],$i)
				$nbTroopsLeft -= $nbTroopsPerEdge * 2
			Next
		Else
			For $i = 0 To $nbSides - 5 ;Four Finger Deployment Barch
				Local $nbTroopsPerEdge = Round($nbTroopsLeft / (($nbSides-1) - $i * 2))
				DropOnEdge($troop, $Edges[$i], $nbTroopsPerEdge, $slotsPerEdge, $Edges[$i + 2],$i, $nbSides)
				$nbTroopsLeft -= $nbTroopsPerEdge * 2
			Next
		EndIf
		Return
	EndIf

	If $nbSides = 4 Then
		For $i = 0 To $nbSides - 3
			Local $nbTroopsPerEdge = Round($nbTroopsLeft / ($nbSides - $i * 2))
			DropOnEdge($troop, $Edges[$i], $nbTroopsPerEdge, $slotsPerEdge, $Edges[$i + 2], $i)
			$nbTroopsLeft -= $nbTroopsPerEdge * 2
		Next
		Return
	EndIf
	For $i = 0 To $nbSides - 1
		If $nbSides = 1 Or ($nbSides = 3 And $i = 2) Then
			Local $nbTroopsPerEdge = Round($nbTroopsLeft / ($nbSides - $i))
			If $iMatchMode = $LB And $iChkDeploySettings[$LB] >= 6 Then  ; Used for DE or TH side attack
				DropOnEdge($troop, $Edges[$BuildingEdge], $nbTroopsPerEdge, $slotsPerEdge)
			Else
				DropOnEdge($troop, $Edges[$i], $nbTroopsPerEdge, $slotsPerEdge)
			EndIf
			$nbTroopsLeft -= $nbTroopsPerEdge
		ElseIf ($nbSides = 2 And $i = 0) Or ($nbSides = 3 And $i <> 1) Then
			Local $nbTroopsPerEdge = Round($nbTroopsLeft / ($nbSides - $i * 2))
			DropOnEdge($troop, $Edges[$i + 3], $nbTroopsPerEdge, $slotsPerEdge, $Edges[$i + 1])
			$nbTroopsLeft -= $nbTroopsPerEdge * 2
		EndIf
	Next
EndFunc   ;==>DropOnEdges

