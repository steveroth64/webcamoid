/* Webcamoid, webcam capture application.
 * Copyright (C) 2016  Gonzalo Exequiel Pedone
 *
 * Webcamoid is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Webcamoid is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Webcamoid. If not, see <http://www.gnu.org/licenses/>.
 *
 * Web-Site: http://webcamoid.github.io/
 */

import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import AkQml 1.0
import AkQmlControls 1.0

ColumnLayout {
    id: configs
    property int cellSize: 50

    function updateKernel(index, value)
    {
        var kernel = Convolve.kernel
        kernel[index] = value
        Convolve.kernel = kernel
    }

    Connections {
        target: Convolve

        onBiasChanged: {
            sldBias.value = bias
            spbBias.rvalue = bias
        }
    }

    Label {
        text: qsTr("Convolve matrix")
    }
    GridLayout {
        columns: 3

        // Row 0
        TextField {
            id: k00
            Layout.preferredWidth: cellSize
            text: Convolve.kernel[0]
            validator: RegExpValidator {
                regExp: /-?\d+/
            }

            onTextChanged: updateKernel(0, text)
        }
        TextField {
            id: k01
            Layout.preferredWidth: cellSize
            text: Convolve.kernel[1]
            validator: RegExpValidator {
                regExp: /-?\d+/
            }

            onTextChanged: updateKernel(1, text)
        }
        TextField {
            id: k02
            Layout.preferredWidth: cellSize
            text: Convolve.kernel[2]
            validator: RegExpValidator {
                regExp: /-?\d+/
            }

            onTextChanged: updateKernel(2, text)
        }

        // Row 1
        TextField {
            id: k10
            Layout.preferredWidth: cellSize
            text: Convolve.kernel[3]
            validator: RegExpValidator {
                regExp: /-?\d+/
            }

            onTextChanged: updateKernel(3, text)
        }
        TextField {
            id: k11
            Layout.preferredWidth: cellSize
            text: Convolve.kernel[4]
            validator: RegExpValidator {
                regExp: /-?\d+/
            }

            onTextChanged: updateKernel(4, text)
        }
        TextField {
            id: k12
            Layout.preferredWidth: cellSize
            text: Convolve.kernel[5]
            validator: RegExpValidator {
                regExp: /-?\d+/
            }

            onTextChanged: updateKernel(5, text)
        }

        // Row 2
        TextField {
            id: k20
            Layout.preferredWidth: cellSize
            text: Convolve.kernel[6]
            validator: RegExpValidator {
                regExp: /-?\d+/
            }

            onTextChanged: updateKernel(6, text)
        }
        TextField {
            id: k21
            Layout.preferredWidth: cellSize
            text: Convolve.kernel[7]
            validator: RegExpValidator {
                regExp: /-?\d+/
            }

            onTextChanged: updateKernel(7, text)
        }
        TextField {
            id: k22
            Layout.preferredWidth: cellSize
            text: Convolve.kernel[8]
            validator: RegExpValidator {
                regExp: /-?\d+/
            }

            onTextChanged: updateKernel(8, text)
        }
    }

    GridLayout {
        columns: 3

        Label {
            text: qsTr("Factor")
        }
        TextField {
            text: Ak.newFrac(Convolve.factor).string
            validator: RegExpValidator {
                regExp: /-?\d+\/\d+/
            }
            Layout.columnSpan: 2
            Layout.fillWidth: true

            onTextChanged: Convolve.factor = Ak.varFrac(Ak.newFrac(text))
        }

        Label {
            text: qsTr("Bias")
        }
        Slider {
            id: sldBias
            value: Convolve.bias
            stepSize: 1
            from: -255
            to: 255
            Layout.fillWidth: true

            onValueChanged: Convolve.bias = value
        }
        AkSpinBox {
            id: spbBias
            rvalue: Convolve.bias
            step: sldBias.stepSize
            minimumValue: sldBias.from
            maximumValue: sldBias.to

            onRvalueChanged: Convolve.bias = rvalue
        }
    }
}
