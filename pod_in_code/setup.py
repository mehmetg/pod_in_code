from setuptools import (
    setup,
    find_packages
)

setup(
    name='pod_in_code',
    version='0.0.1',
    packages=find_packages(),
    url='',
    license='MIT',
    author='Mehmet Gerceker',
    author_email='mehmetg@msn.com',
    description='custom k8s executor with pod in code',
    classifiers=[
        'Development Status :: 3 - Alpha',
        'Intended Audience :: Developers',
        'Operating System :: OS Independent',
        'License :: OSI Approved :: MIT License',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3.6',
        'Programming Language :: Python :: 3.7',
        'Programming Language :: Python :: 3.8',
    ],
    python_requires='>=2.7.16',
    install_requires=[
        'apache-airflow[kubernetes]'
    ],
)
