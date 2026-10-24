FROM julia:1

RUN apt-get update \
    && apt-get install -y --no-install-recommends git xdg-utils \
    && rm -rf /var/lib/apt/lists/*

# Pkgimages are built on the CI runner but must load on whatever CPU the codespace lands on.
ENV JULIA_CPU_TARGET="generic;sandybridge,-xsaveopt,clone_all;haswell,-rdrnd,base(1)"
ENV JULIA_PROJECT=/opt/tutorials
COPY Project.toml /opt/tutorials/
COPY startup.jl /root/.julia/config/startup.jl
RUN julia -e 'using Pkg; Pkg.instantiate(); using CDAWeb, WGLMakie, SpacePhysicsMakie'
