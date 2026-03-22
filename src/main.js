const exploraTitle = document.getElementById("explora-title");
let containerPosX = "";

const swipers = document.querySelectorAll(".swiper");

swipers.forEach((swiperEl) => {
  let containerPosX = exploraTitle.getBoundingClientRect().left - 16;

  new Swiper(swiperEl, {
    slidesPerView: "auto",
    spaceBetween: 30,
    slidesOffsetBefore: containerPosX,
    navigation: {
      nextEl: swiperEl.querySelector(".swiper-button-next"),
      prevEl: swiperEl.querySelector(".swiper-button-prev"),
      addIcons: false,
    },
    pagination: {
      el: swiperEl.querySelector(".swiper-pagination"),
      clickable: true,
    },
  });
});

console.log(containerPosX);
