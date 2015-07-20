var gulp = require("gulp");
var browserSync = require("browser-sync");

gulp.task("default", ["browserSync"], function() {
    gulp.watch("app/views/**/*.slim", browserSync.reload);
    gulp.watch("app/assets/stylesheets/**/*.scss", browserSync.reload);
    gulp.watch("app/assets/stylesheets/**/*.scss.erb", browserSync.reload);
    gulp.watch("app/assets/javascripts/**/*.coffee", browserSync.reload);
});

gulp.task("browserSync", function() {
    browserSync.init({
        proxy: "localhost:3000"
    })
});
