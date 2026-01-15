FROM node:20

# إعداد المتغيرات المطلوبة لهجينج فيس
ENV NODE_ENV=PROD
ENV PORT=7860

# تحديد مكان العمل
WORKDIR /app

# نسخ ملفات التعريف أولاً لسرعة التحميل (Caching)
COPY package*.json ./

# تثبيت المكتبات
RUN npm install

# نسخ باقي ملفات المشروع
COPY . .

# بناء المشروع (tsconfig/build)
RUN npm run build

# فتح البورت المطلوب
EXPOSE 7860

# تشغيل السيرفر
CMD [ "npm", "start" ]
