/* Webcamoid, webcam capture application.
 * Copyright (C) 2011-2014  Gonzalo Exequiel Pedone
 *
 * Webcamod is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Webcamod is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Webcamod. If not, see <http://www.gnu.org/licenses/>.
 *
 * Email     : hipersayan DOT x AT gmail DOT com
 * Web-Site 1: http://github.com/hipersayanX/Webcamoid
 * Web-Site 2: http://kde-apps.org/content/show.php/Webcamoid?content=144796
 */

#ifndef CONVOLVEELEMENT_H
#define CONVOLVEELEMENT_H

#include <qb.h>
#include <qbutils.h>

class ConvolveElement: public QbElement
{
    Q_OBJECT
    Q_PROPERTY(QVariantList kernel READ kernel WRITE setKernel RESET resetKernel)
    Q_PROPERTY(QSize kernelSize READ kernelSize WRITE setKernelSize RESET resetKernelSize)
    Q_PROPERTY(QbFrac factor READ factor WRITE setFactor RESET resetFactor)
    Q_PROPERTY(int bias READ bias WRITE setBias RESET resetBias)

    public:
        explicit ConvolveElement();
        Q_INVOKABLE QVariantList kernel() const;
        Q_INVOKABLE QSize kernelSize() const;
        Q_INVOKABLE QbFrac factor() const;
        Q_INVOKABLE int bias() const;

    private:
        QVector<int> m_kernel;
        QSize m_kernelSize;
        QbFrac m_factor;
        int m_bias;

        QbElementPtr m_convert;

    public slots:
        void setKernel(const QVariantList &kernel);
        void setKernelSize(const QSize &kernelSize);
        void setFactor(const QbFrac &factor);
        void setBias(int bias);
        void resetKernel();
        void resetKernelSize();
        void resetFactor();
        void resetBias();
        QbPacket iStream(const QbPacket &packet);
};

#endif // CONVOLVEELEMENT_H
